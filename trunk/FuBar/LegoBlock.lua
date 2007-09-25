local LEGO_BLOCK_MAJOR = "LegoBlock-Beta1"

-- The idea is not to make FuBarPlugin-2.0 fully works with LegoBlock, but a temporary hack so that people can use plugins without forcing to use FuBar.
-- So there are lots of hacks in the current implementation, which probably won't work for every case and won't work forever.
-- The real solution is to actually port the plugins to LegoBlocks, it should be very easy.

local LegoBlock = LibStub(LEGO_BLOCK_MAJOR)

local frame

local L = setmetatable({}, {__index=function(t,k) return k end})

local donothing = function() end
local Core = DongleStub("Dongle-1.1"):New("FuBar2LegoBlock")

Core.plugins = {}
Core.unreadyPlugins = {}

-- Fake FuBar to cheat others.
_G["FuBar"] = {}
local FuBar = _G["FuBar"]

-- Modules should insert themselves to here.
FuBar.modules = {}

FuBar.core = Core

-- FuBarPlugin-2.0 checks this version string.
FuBar.version = "4.0.99999"

-- A empty DB to cheat FuBarPlugin-2.0, until I actually implements FuBar configurations map.
FuBar.db = { profile = {} }

-- A fake FuBarPanel.
local FakePanel = {}

-- A proper FuBarPlugin should support the following methods:
-- GetName GetTitle GetCategory SetFontSize GetFrame Show Hide GetPanel SetPanel GetName GetTitle GetCategory GetFrameType IsDiabled

-- A proper FuBarPanel should support the following methods:
-- AddPlugin RemovePlugin GetNumPlugins GetPlugin HasPlugin GetPluginSide UpdateCenteredPosition SetPluginSide GetAttachPoint

-- FuBar_Panel API Maps.

function FakePanel:AddPlugin(plugin)
	local oldPanel = plugin:GetPanel()
	if oldPanel and oldPanel ~= FakePanel then
		oldPanel:RemovePlugin(plugin)
	end
	plugin:SetPanel(self)
	Core.SetupLegoBlock(plugin)
	plugin.lbObj:Show()
	local pluginID = Core.GetUniqueID(plugin)
	Core.db.profile.detached[pluginID] = nil
	-- the MinimapContainer in FuBarPlugin-2.0 should do this in its :RemovePlugin() IMO.
	if plugin.minimapFrame then
		plugin.minimapFrame:Hide()
	end
	plugin:Update()
end

-- The actual API is RemovePlugin(index, side), but index can be either 'plugin index' or 'plugin object'.
-- FuBarPlugin-2.0 only pass 'plugin object'.
function FakePanel:RemovePlugin(plugin)
	if type(plugin) ~= 'table' then
		return
	end
	if plugin:GetPanel() == FakePanel then
		plugin:SetPanel(nil)
		plugin:GetFrame():Hide()
		local pluginID = Core.GetUniqueID(plugin)
		Core.db.profile.detached[pluginID] = true
	end
end

function FakePanel:GetNumPlugins()
	return #(Core.plugins)
end

function FakePanel:GetPlugin(index, side)
	return Core.plugins[index]
end

function FakePanel:HasPlugin(plugin)
	for i, corePlugin in ipairs(Core.plugins) do
		if plugin == corePlugin then
			return true
		end
	end
	return false
end

function FakePanel:GetPluginSide(plugin)
	return "LEFT"
end

function FakePanel:SetPluginSide(plugin, side)

end

function FakePanel:UpdateCenteredPosition()

end


-- FuBar API Map.

function FuBar:GetPanel(panelId)
	return FakePanel
end

function FuBar:IsHidingTooltipsInCombat()
	return Core.db.profile.hidingTooltipsInCombat
end

function FuBar:ShowPlugin(plugin, panelId)
	if panelId then
		FakePanel:AddPlugin(plugin,true)
	end
end

function FuBar:IsChangingProfile()
	return false
end

FuBar.plugins = Core.plugins

-- Plugins is supposed to call this in OnEmbedInitialize, which is called before OnInitialize,
--   so I can safely assume that the plugin is still not initialized when this is being called.
function FuBar:RegisterPlugin(plugin)
	table.insert(Core.plugins,plugin)
	Core.CreateLegoBlock(plugin)
	table.insert(Core.unreadyPlugins, plugin)
	-- Schedule to update plugin after the plugin is fully initialized.
	if IsLoggedIn() then
		Core.SetupPluginsLater()
	end
end

function FuBar:GetNumPanels()
	return 0
end

-- Core functions. I'm lazy to declare local functions so I put them all in a table, also useful for easy external access when I want.

-- Get an unique ID for the plugin.
function Core.GetUniqueID(plugin)
	return plugin.folderName or plugin:GetTitle()
end

-- Create the LegoBlock, the saved variables might not be loaded when this is being called.
function Core.CreateLegoBlock(plugin)
	
	if plugin.lbObj then
		return true
	end

	local pluginID = Core.GetUniqueID(plugin)
	
	local lbObj = LegoBlock:New(pluginID)
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
	fakeIconFrame.GetTexture = function(frame) return lbObj.Icon:GetTexture() end
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
	fakeTextFrame.SetText = function(frame,text) lbObj:SetText(text) end
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

	plugin.frame = lbObj
	plugin.CheckWidth = donothing
	
	-- Do not show the LegoBlock yet, as it is still not correctly initialized (saved DB is not injected yet).
	lbObj:Hide()
end

-- Fully initialize the LegoBlock, inject saved DB to it, SV should be loaded when this is being called.
function Core.SetupLegoBlock(plugin)

	if plugin.lbDataReady then
		return true
	end
	
	Core.CreateLegoBlock(plugin)
	
	local pluginID = Core.GetUniqueID(plugin)
	
	if not Core.db.profile.pluginDB[pluginID] then
		Core.db.profile.pluginDB[pluginID] = {}
	end
	
	local lbOptions = Core.db.profile.pluginDB[pluginID]
	lbOptions.showText = plugin:IsTextShown()
	lbOptions.showIcon = plugin:IsIconShown()
	
	plugin.lbObj:SetDB(lbOptions)
	
	plugin.lbDataReady = true
	
end

function Core.SetupPlugins()
	for k,plugin in pairs(Core.unreadyPlugins) do
		if not plugin:IsDisabled() then
			local pluginID = Core.GetUniqueID(plugin)
			if Core.db.profile.detached[pluginID] then
				plugin:Show(0)
			else
				FakePanel:AddPlugin(plugin)
			end
		end
		Core.unreadyPlugins[k] = nil
	end
end

function Core.Enable()
	local defaultOptions = {
		profile = {
			detached = {},
			pluginDB = {},
			lod = {},
		}
	}
	Core.db = Core:InitializeDB("FBP2LBDB", defaultOptions, "default")
	
	local cmd = Core:InitializeSlashCommand("FuBar2LegoBlock Slash Command", "FUBAR2LEGOBLOCK", "fubar")
	FuBar.cmd = cmd
	
	cmd:InjectDBCommands(Core.db, "copy", "delete", "list", "reset", "set")
	cmd:RegisterSlashHandler(L["Prevent tooltips from showing in combat"], "combat", "ToggleHidingTooltipsInCombat")
	
	Core.SetupPluginsLater()
	
	local loadManager = FuBar.modules["LoadManager"]
	if loadManager then
		loadManager.SetDB(Core.db.profile.lod)
		Core:ScheduleTimer("FBP2LB_LOAD_LOD_PLUGINS", loadManager.LoadLODPlugins, 3)
	end
	
end

function Core.SetupPluginsLater()
	Core:ScheduleTimer("FBP2LB_SETUP_PLUGINS", Core.SetupPlugins, 2)
end


function Core:ToggleHidingTooltipsInCombat()
	Core.db.profile.hidingTooltipsInCombat = not Core.db.profile.hidingTooltipsInCombat
	Core:PrintF(L["hideTooltipsInCombat is now set to %s"], tostring(Core.db.profile.hidingTooltipsInCombat))
end
