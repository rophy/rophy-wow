-- try "LegoBlock-Beta0" or "LegoBlock-Beta1"
local LEGO_BLOCK_MAJOR = "LegoBlock-Beta0"

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

local SetupLegoBlock
local SetupPlugins
local Initialize
local AddPlugin
local donothing = function() end

-- Fake FuBar to cheat others.
FuBar = {}
local Fubar = FuBar

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
	plugin.iconFrame = lbObj.Icon
	plugin.textFrame = lbObj.Text
	plugin:SetIcon(plugin.hasIcon)

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
	local function CheckWidth(self,force)
		hooks[CheckWidth](self,force)
		
		-- This refreshes frame width when it is too small.
		if force then
			if lbObj.Icon:IsShown() then
				lbObj:ShowIcon(true)
			end
		end
	end
	hooks[CheckWidth] = plugin.CheckWidth
	plugin.CheckWidth = CheckWidth
	plugin:CheckWidth(true)

end

function SetupPlugins()
	for plugin in pairs(plugins) do
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

function Initialize()
	if not _G["FuBar2LegoBlockDB"] then
		_G["FuBar2LegoBlockDB"] = {
			ignoredPlugins = {},
			pluginDB = {}
		}
	end
	db = _G["FuBar2LegoBlockDB"]
	SetupPlugins()
end
local frame = CreateFrame("Frame")
frame:SetScript("OnEvent", Initialize)
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

--[[
HelloFrame =  LibStub("LegoBlock-Beta1"):New("HelloWorld", "Hello!!!", nil, {})
HelloFrame:SetIcon("Interface\\AddOns\\FuBar_DuraTek\\icon")
HelloFrame:ShowIcon(true)
]]