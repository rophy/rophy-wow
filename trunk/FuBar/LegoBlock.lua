
-- This is here so I can embed the code to FuBar for easy switching of two addons, will remove when I finish the addon.
if true then

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

	local frame
	local Tablet = AceLibrary:HasInstance("Tablet-2.0") and AceLibrary("Tablet-2.0")
	local FuBarPlugin = AceLibrary:HasInstance("FuBarPlugin-2.0") and AceLibrary("FuBarPlugin-2.0")

	local donothing = function() end
	local Core = {}
	
	Core.plugins = {}
	Core.unreadyPlugins = {}

	-- Fake FuBar to cheat others.
	_G["FuBar"] = {}
	local FuBar = _G["FuBar"]
	FuBar.core = Core

	-- FuBarPlugin-2.0 checks this version string.
	FuBar.version = MAJOR_VERSION .. "." .. MINOR_VERSION

	-- A empty DB to cheat FuBarPlugin-2.0, until I actually implements FuBar configurations map.
	FuBar.db = { profile = {} }

	-- A fake FuBarPanel.
	local PanelMap = {}

	-- FuBarPanel API Maps.

	function PanelMap:AddPlugin(plugin)
		Core.AddPlugin(plugin,true)
	end
	

	function PanelMap:RemovePlugin(plugin)
		local pluginTitle = Core.GetUniqueID(plugin)
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
		if Core.plugins[plugin] then
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
		Core.plugins[plugin] = true
		
		-- Optional FuBar2nSideBar support.
		local mapper = FuBar.nSideBarMapper
		if mapper then
			if mapper.RegisterPlugin(plugin) then
				return
			end
		end
		Core.CreatePluginMapper(plugin)
		table.insert(Core.unreadyPlugins, plugin)
		if IsLoggedIn() then
			Core.StartTimedCallback(0.2, Core.SetupPlugins)
		end
	end
	function FuBar:GetNumPanels()
		return 0
		-- TODO: Implement this.
	end

	function Core.GetUniqueID(plugin)
		return plugin.folderName or plugin:GetTitle()
	end
	-- Add plugin to LegoBlock.
	function Core.AddPlugin(plugin,checkDB)
		if checkDB then
			for i, pluginTitle in ipairs(Core.db.ignoredPlugins) do
				if pluginTitle == Core.GetUniqueID(plugin) then
					table.remove(Core.db.ignoredPlugins, i)
					break
				end
			end
		end
		InitPluginMapper(plugin)
		plugin.lbObj:Show()
		if plugin.minimapFrame then
			plugin.minimapFrame:Hide()
		end
		plugin:SetPanel(PanelMap)
	end



	-- Create the LegoBlock, the saved variables might not be loaded when this is being called.
	function Core.CreatePluginMapper(plugin)
		
		if plugin.lbObj then
			return true
		end

		local pluginTitle = Core.GetUniqueID(plugin)
		
		local lbObj = LB:New(pluginTitle)
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

		plugin.frame = lbObj
		plugin.CheckWidth = donothing
		
		lbObj:Hide()
	end

	-- Create LegoBlock, and map the plugin to work correctly with the LegoBlock.
	function Core.InitPluginMapper(plugin)
		if plugin.lbDataReady then
			return true
		end
		
		Core.CreatePluginMapper(plugin)
		
		local pluginTitle = Core.GetUniqueID(plugin)
		
		if not Core.db.pluginDB[pluginTitle] then
			Core.db.pluginDB[pluginTitle] = {}
		end
		
		local lbOptions = Core.db.pluginDB[pluginTitle]
		lbOptions.showText = plugin:IsTextShown()
		lbOptions.showIcon = plugin:IsIconShown()
		
		plugin.lbObj:SetDB(lbOptions)
		
		plugin.lbDataReady = true

		--[[ May be noneed call this if LegoBlock is created before SV loaded.
		if not plugin.blizzardTooltip and not plugin.overrideTooltip and Tablet then
			-- Note that we have to do this after :SetScript("OnEnter"), etc,
			-- so that Tablet-2.0 can override it properly.
			FuBarPlugin.RegisterTablet(plugin)
			Tablet:Register(lbObj, plugin.frame)
		end
		]]
		
		plugin.lbObj:Show()
		plugin:Update()

	end

	function Core.isIgnoredPluginName(name)
		if not Core.db or not Core.db.ignoredPlugins then
			return nil
		end
		for i, pluginTitle in ipairs(Core.db.ignoredPlugins) do
			if name == pluginTitle then
				return true
			end
		end
		return false
	end
	
	function Core.IsIgnoredPlugin(plugin)
		return Core.isIgnoredPluginName(Core.GetUniqueID(plugin))
	end

	function Core.ShowPlugin(plugin,checkDB)
		if not Core.IsIgnoredPlugin(plugin) and not plugin:IsDisabled() then
			plugin:Show(0)
		else
			Core.AddPlugin(plugin,checkDB)
		end
	end

	function Core.SetupPlugins()
		if FuBarPlugin then
			for k,plugin in pairs(Core.unreadyPlugins) do
				Core.InitPluginMapper(plugin)
				Core.ShowPlugin(plugin)
				Core.unreadyPlugins[k] = nil
			end
		end
	end
	
	function Core.LoadLoDPlugins()
		
	end

	function Core.Activate()
		Core.frame = CreateFrame("Frame")
		Core.frame:SetScript("OnEvent", Core.Initialize)
		Core.frame:RegisterEvent("PLAYER_ENTERING_WORLD")
		Core.frame:Hide()
		Core.frame:SetScript("OnUpdate", Core.OnUpdate)
	end

	function Core.Initialize(frame,event,...)
		if not _G["FuBar2LegoBlockDB"] then
			_G["FuBar2LegoBlockDB"] = {
				ignoredPlugins = {},
				pluginDB = {}
			}
		end
		Core.db = _G["FuBar2LegoBlockDB"]
		Core.SetupPlugins()
		Core.StartTimedCallback(2,Core.LoadLoadOnDemandPlugins)
	end

	local total = 0
	local timer
	local Callback
	function Core.StartTimedCallback(delay, callback)
		Callback = callback
		timer = delay
		total = 0
		Core.frame:Show()
	end
	
	function Core.OnUpdate(frame,elapsed)
		total = total + elapsed
		if total > timer then
			total = 0
			Core.frame:Hide()
			Callback()
		end
	end
	Core.Activate()
	
	function Core.findFuBarDep(...)
		for i = 1, select("#", ...) do
			local dep = select(i, ...)
			if dep == "FuBar" then
				return true
			end
		end
	end
	
	function Core.isFuBarDependent(name)
		local data = GetAddOnMetadata(name, "X-FuBar-Dependent")
		data = tonumber(data) or data
		if data and data ~= 0 then
			return true
		end
		return Core.findFuBarDep(GetAddOnDependencies(name))
	end

	function Core.LoadLoadOnDemandPlugins()
		for i = 1, GetNumAddOns() do
			local name, _, notes, enabled, loadable = GetAddOnInfo(i)
			if IsAddOnLoadOnDemand(i) and enabled and loadable and not IsAddOnLoaded(i) then
				if Core.isFuBarDependent(name) then
					if not Core.isIgnoredPluginName(name) then
						LoadAddOn(name)
					end
				end
			end
		end
	end



	if true then return end
end

