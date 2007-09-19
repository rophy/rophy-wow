-- try "LegoBlock-Beta0" or "LegoBlock-Beta1"
local LEGO_BLOCK_MAJOR = "LegoBlock-Beta1"

-- The idea is not to make FuBarPlugin-2.0 fully works with LegoBlock, but a temporary hack so that people can use plugins without forcing to use FuBar.
-- So there are lots of hacks in the current implementation, which probably won't work for every case and won't work forever.
-- The real solution is to actually port the plugins to LegoBlocks, it should be very easy.

local MAJOR_VERSION = "9.9"
local MINOR_VERSION = tonumber((string.gsub("$Revision: 36844 $", "^.-(%d+).-$", "%1")))

local LB
if LEGO_BLOCK_MAJOR == "LegoBlock-Beta0" then
	LB = DongleStub(LEGO_BLOCK_MAJOR)
elseif LEGO_BLOCK_MAJOR == "LegoBlock-Beta1" then
	LB = LibStub(LEGO_BLOCK_MAJOR)
end

local Tablet = AceLibrary:HasInstance("Tablet-2.0") and AceLibrary("Tablet-2.0")
local FuBarPlugin = AceLibrary:HasInstance("FuBarPlugin-2.0") and AceLibrary("FuBarPlugin-2.0")

-- Location function declarations.
local Activate
local SetupLegoBlock
local SetupPlugins
local Initialize
local AddPlugin
local donothing = function() end

local FuBar = {}

-- FuBarPlugin-2.0 checks this version string.
FuBar.version = MAJOR_VERSION .. "." .. MINOR_VERSION

-- A empty DB to cheat FuBarPlugin-2.0, until I actually implements FuBar configurations map.
FuBar.db = { profile = {} }

-- Store registered plugins, in the form plugins[plugin] = true.
local plugins = {}

-- Linking so that I can check this table externally.
FuBar.plugins = plugins

-- This is the real DB.
local db

-- A fake FuBarPanel.
local PanelMap = {}

-- Hooks.
local hooks = {}

-- FuBarPanel API Maps.

function PanelMap:AddPlugin(plugin)
	AddPlugin(plugin,true)
end

function PanelMap:RemovePlugin(plugin)
	local pluginTitle = plugin:GetTitle()
	table.insert(db.ignoredPlugins,pluginTitle)
	if plugin.lbObj then
		plugin.lbObj:Hide()
	end
	plugin:SetPanel(nil)
end

function PanelMap:GetNumPlugins()
	return 1
	-- TODO: Implement this.
end

function PanelMap:GetPlugin(index, side)
	-- TODO: Implement this.
end

function PanelMap:HasPlugin(plugin)
	if plugins[plugin] then
		return true
	end
end

function PanelMap:GetPluginSide(plugin)
	-- TODO: Implement this.
end

function PanelMap:UpdateCenteredPosition()
	-- TODO: Implement this.
end

function FuBar:GetPanel(panelId)
	return PanelMap
end

function FuBar:IsHidingTooltipsInCombat()
	-- TODO: Implement this.
end
function FuBar:ShowPlugin(plugin, panelId)
	if panelId then
		PanelMap:AddPlugin(plugin,true)
	end
end
function FuBar:IsChangingProfile()
	-- TODO: Implement this.
end
function FuBar:RegisterPlugin(plugin)
	plugins[plugin] = true
end
function FuBar:GetNumPanels()
	return 0
	-- TODO: Implement this.
end

-- Add plugin to LegoBlock.
function AddPlugin(plugin,checkDB)
	if checkDB then
		for i, pluginTitle in ipairs(db.ignoredPlugins) do
			if pluginTitle == plugin:GetTitle() then
				table.remove(db.ignoredPlugins, i)
				break
			end
		end
	end
	SetupLegoBlock(plugin)
	plugin.lbObj:Show()
	if plugin.minimapFrame then
		plugin.minimapFrame:Hide()
	end
	plugin:SetPanel(PanelMap)
end

-- Create LegoBlock, and map the plugin to work correctly with the LegoBlock.
function SetupLegoBlock(plugin)
	if plugin.lbObj then
		return true
	end
	
	local pluginTitle = plugin:GetTitle()
	if not db.pluginDB[pluginTitle] then
		db.pluginDB[pluginTitle] = {}
	end
	
	local lbOptions = db.pluginDB[pluginTitle]
	lbOptions.showText = plugin:IsTextShown()
	
	local lbObj = LB:New(plugin.name, nil, nil, db.pluginDB[pluginTitle])
	plugin.lbObj = lbObj
	
	lbObj.self = plugin
	
	local iconPath = plugin.iconFrame and plugin.iconFrame:GetTexture()
	
	-- Frame Width Management is a big problem here.
	-- Frames include textFrame, iconFrame and mainFrame.
	-- Approach A: let FuBarPlugin-2.0 manage the frame width, but it doesn't work very well because LegoBlock have different backdrop.
	-- Approach B: let LegoBlock manage the frame width, in this case I need to 
	--  prevent FuBarPlugin-2.0 from changing width while still giving it access to other frame methods.
	
	
	
	-- Approach B : create fake frames to cheat FuBarPlugin-2.0, map those important functions out.
	-- A table with metatable magic doesn't work because many fontString methods require the 'this' variable which is set by Blizzard C code.

	local fakeIconFrame = lbObj:CreateTexture(nil, "ARTWORK")
	fakeIconFrame.SetTexture = function(frame,path) lbObj:SetIcon(path) end
	fakeIconFrame.SetTexCoord = function(frame,...) lbObj.Icon:SetTexCoord(...) end
	fakeIconFrame.IsShown = function(frame) return lbObj.Icon:IsShown() end
	fakeIconFrame.Show = function(frame) lbObj:ShowIcon(true) end
	fakeIconFrame.Hide = function(frame) lbObj:ShowIcon(false) end
	plugin.iconFrame = fakeIconFrame
	if plugin.hasIcon then
		plugin:SetIcon(iconPath)
	end
	
	local fakeTextFrame = lbObj:CreateFontString(nil, "ARTWORK")
	fakeTextFrame:SetFontObject(GameFontNormal)
	fakeTextFrame.SetText = function(frame,text)
		local isShown = lbObj.Text:IsShown()
		lbObj:SetText(text)
		if not isShown then
			lbObj.Text:Hide()
		end
	end
	fakeTextFrame.GetText = function(frame) return lbObj.Text:GetText() end
	fakeTextFrame.Show = function(frame) lbObj:ShowText(true) end
	fakeTextFrame.Hide = function(frame) lbObj:ShowText(false) end
	fakeTextFrame.IsShown = function(frame) return lbObj.Text:IsShown() end
	plugin.textFrame = fakeTextFrame
	
	local pluginFrame = plugin.frame
	lbObj:SetScript("OnMouseDown", pluginFrame:GetScript("OnMouseDown"))
	lbObj:SetScript("OnMouseUp", pluginFrame:GetScript("OnMouseUp"))
	lbObj:SetScript("OnDoubleClick", pluginFrame:GetScript("OnDoubleClick"))
	lbObj:SetScript("OnClick", pluginFrame:GetScript("OnClick"))
	lbObj:SetScript("OnEnter", pluginFrame:GetScript("OnEnter"))
	lbObj:SetScript("OnLeave", pluginFrame:GetScript("OnLeave"))
	if not plugin.blizzardTooltip and not plugin.overrideTooltip and Tablet then
		-- Note that we have to do this after :SetScript("OnEnter"), etc,
		-- so that Tablet-2.0 can override it properly.
		FuBarPlugin.RegisterTablet(plugin)
		Tablet:Register(lbObj, plugin.frame)
	end
	plugin.frame = lbObj
	plugin.CheckWidth = donothing

end

function SetupPlugins()
	if FuBarPlugin then
		for plugin in pairs(FuBarPlugin.registry) do
			local found = false
			for i, pluginTitle in ipairs(db.ignoredPlugins) do
				if plugin:GetTitle() == pluginTitle then
					found = true
					break
				end
			end
			if found and not plugin:IsDisabled() then
				plugin:Show(0)
			else
				AddPlugin(plugin,false)
			end
		end
	end
	for plugin in pairs(plugins) do
	end
end

function Initialize()
	if not _G["FBP2LBDB"] then
		_G["FBP2LBDB"] = {
			ignoredPlugins = {},
			pluginDB = {}
		}
	end
	db = _G["FuBar2LegoBlockDB"]
	SetupPlugins()
end

function Activate()
	local frame = CreateFrame("Frame")
	frame:SetScript("OnEvent", Initialize)
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
end

Activate()


if true then return end

