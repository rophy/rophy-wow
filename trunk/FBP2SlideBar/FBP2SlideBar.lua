-- Change "Attach to minimap" to "Add buttons to nSideBar".

--[[
Intended functionalties:
	* toggle the behavior on and off for any plugin at any time.
	* let user specify which plugins will be converted on intialize, with two different approaches:
		* white list : no plugins will be converted except those specified.
		* (using this one) black list : all plugins will be converted except those specified.
	* it is possible to add plugins to nSideBar without hooking the "attach to minimap"
		but I found the current approach more convenient and easier to configure.
]]

local nSideBar = LibStub("SlideBar")
local FuBar = nil

local Core = {}


--[[-------------------------------------------------------------------------
	Utility Functions
---------------------------------------------------------------------------]]

-- Get optional AceLibrary-based libraries.
Core.optLibs = setmetatable({}, {
	__index = function(t,k)
		local lib = AceLibrary and AceLibrary:HasInstance(k) and AceLibrary(k)
		t[k] = lib
		return lib
	end
})


function Core.GetUniqueId(plugin)
	return plugin.folderName or plugin:GetTitle()
end



--[[-------------------------------------------------------------------------
	FuBarPanel Emulation
---------------------------------------------------------------------------]]

local Panel = {}
Core.Panel = Panel

-- A proper FuBarPanel should support the following methods:
-- AddPlugin RemovePlugin GetNumPlugins GetPlugin HasPlugin GetPluginSide UpdateCenteredPosition SetPluginSide GetAttachPoint
Panel.plugins = {}
Panel.origMinimapFrames = {}

function Panel:AddPlugin(plugin)
	local oldPanel = plugin:GetPanel()
	if oldPanel then
		if oldPanel == self then
			return false
		else
			oldPanel:RemovePlugin(plugin)
		end
	end
	plugin:SetPanel(self)
	table.insert(self.plugins,plugin)

	local origMinimapFrame = plugin.minimapFrame
	if origMinimapFrame then
		origMinimapFrame:Hide()
	end
	plugin.frame:Hide()

	local button, buttonId = Core.GetOrCreateButton(plugin)
	nSideBar.ShowButton(buttonId)
	
	Panel.origMinimapFrames[plugin] = origMinimapFrame
	plugin.minimapFrame = button
	
	plugin:Update()
end

-- The actual API is RemovePlugin(index, side), but index can be either 'plugin index' or 'plugin object'.
-- FuBarPlugin-2.0 only pass 'plugin object'.
function Panel:RemovePlugin(index, side)
	local plugin
	
	if type(index) == 'number' then
		plugin = self.plugins[index]

	elseif type(index) == 'table' then
		plugin = index
	else
		error("index must be number or table")
	end
	
	if not plugin then
		return false
	end

	if plugin:GetPanel() ~= Panel then
		return false
	end

	plugin:SetPanel(nil)
	
	if index == plugin then
		for i, iPlugin in ipairs(self.plugins) do
			if iPlugin == index then
				index = i
				break
			end
		end
	end
	
	table.remove(self.plugins,index)
	
	local button, buttonId = Core.GetOrCreateButton(plugin)
	nSideBar.HideButton(buttonId)
	
	plugin.minimapFrame = Panel.origMinimapFrames[plugin]

	return true
	
end

function Panel:GetNumPlugins()
	return #self.plugins
end

function Panel:GetPlugin(index, side)
	return self.plugins[index]
end

function Panel:HasPlugin(plugin)
	return not not self.plugins[index]
end

function Panel:GetPluginSide(plugin)
	return "LEFT"
end

function Panel:SetPluginSide(plugin, side)

end

function Panel:UpdateCenteredPosition()

end

--[[-------------------------------------------------------------------------
	 nSideBar Button Conversion
---------------------------------------------------------------------------]]

--local scriptsToMap = {"OnMouseUp", "OnDoubleClick", "OnClick", "OnEnter", "OnLeave" }

local frame_OnClick, frame_OnDoubleClick, frame_OnMouseDown, frame_OnMouseUp, frame_OnReceiveDrag, frame_OnEnter, frame_OnLeave

function Core.AddButtonScript(button, script, handler)
	local buttonScript = button:GetScript(script)
	if not buttonScript then
		button:SetScript(script, handler)
	else
		button:SetScript(script, function(...)
			buttonScript(...)
			handler(...)
		end)
	end
end


function Core.GetOrCreateButton(plugin)

	local buttonId = Core.GetUniqueId(plugin)
	local button = nSideBar.GetButton(buttonId)
	if not button then
	
		-- Create the nSideBar button.
		local iconPath = plugin.iconFrame and plugin.iconFrame:GetTexture() or "Interface\\Icons\\INV_Misc_QuestionMark"
		button = nSideBar.AddButton(buttonId, iconPath)
		
		-- FuBarPlugin-2.0 uses this reference.
		button.self = plugin
		
		
		local pluginFrame = plugin.frame
		
		-- The following implementation is copied from FuBarPlugin-2.0's MinimapPanel.
		
		local frame = button
		if not frame_OnEnter then
			function frame_OnEnter()
				nSideBar.WaitFor(Tablet20Frame)
				if type(this.self.OnEnter) == "function" then
					this.self:OnEnter()
				end
			end
		end
		Core.AddButtonScript(frame, "OnEnter", frame_OnEnter)
		if not frame_OnLeave then
			function frame_OnLeave()
				if type(this.self.OnLeave) == "function" then
					this.self:OnLeave()
				end
			end
		end
		Core.AddButtonScript(frame, "OnLeave", frame_OnLeave)
		if not frame_OnClick then
			function frame_OnClick()
				if this.self:IsMinimapAttached() and this.dragged then return end
				if type(this.self.OnClick) == "function" then
					this.self:OnClick(arg1)
				end
			end
		end
		Core.AddButtonScript(frame, "OnClick", frame_OnClick)
		if not frame_OnDoubleClick then
			function frame_OnDoubleClick()
				if type(this.self.OnDoubleClick) == "function" then
					this.self:OnDoubleClick(arg1)
				end
			end
		end
		Core.AddButtonScript(frame, "OnDoubleClick", frame_OnDoubleClick)
		if not frame_OnReceiveDrag then
			function frame_OnReceiveDrag()
				if (this.self:IsMinimapAttached() and not this.dragged) and type(this.self.OnReceiveDrag) == "function" then
					this.self:OnReceiveDrag()
				end
			end
		end
		Core.AddButtonScript(frame, "OnReceiveDrag", frame_OnReceiveDrag)
		if not minimap_OnMouseDown then
			function minimap_OnMouseDown()
				if arg1 == "LeftButton" and not IsModifierKeyDown() then
					HideDropDownMenu(1)
					if type(this.self.OnMouseDown) == "function" then
						this.self:OnMouseDown(arg1)
					end
				elseif arg1 == "RightButton" and not IsModifierKeyDown() then
					this.self:OpenMenu(this)
					nSideBar.WaitFor(Dewdrop20Level1)
				else
					HideDropDownMenu(1)
					if type(this.self.OnMouseDown) == "function" then
						this.self:OnMouseDown(arg1)
					end
				end
			end
		end
		Core.AddButtonScript(frame, "OnMouseDown", minimap_OnMouseDown)
		if not minimap_OnMouseUp then
			function minimap_OnMouseUp()
				if type(this.self.OnMouseUp) == "function" then
					this.self:OnMouseUp(arg1)
				end
			end
		end
		Core.AddButtonScript(frame, "OnMouseUp", minimap_OnMouseUp)
		
		local Tablet = Core.optLibs["Tablet-2.0"]
		local FuBarPlugin = Core.optLibs["FuBarPlugin-2.0"]

		if FuBarPlugin and Tablet and not plugin.blizzardTooltip and not plugin.overrideTooltip then
			-- Note that we have to do this after :SetScript("OnEnter"), etc,
			-- so that Tablet-2.0 can override it properly.
			
			FuBarPlugin.RegisterTablet(plugin)
			Tablet:Register(button, plugin.frame)
		end

	end
	
	return button, buttonId

end

function Core.IsMinimapFrameConverted(plugin)
	local currMinimapFrame = plugin.minimapFrame
	local buttonId = Core.GetUniqueId(plugin)
	local button = nSideBar.GetButton(pluginId)
	return (currMinimapFrame and button == currMinimapFrame)
end

--[[-------------------------------------------------------------------------
	"Attach to minimap" Hooking
---------------------------------------------------------------------------]]


-- Automatic hooking of FuBarPlugin-2.0	
Core.orig = setmetatable({}, {
	__index = function(t,k)
		local FuBarPlugin = Core.optLibs["FuBarPlugin-2.0"]
		if FuBarPlugin then
			t[k] = FuBarPlugin[k]
			FuBarPlugin[k] = Core[k]
		end
		return t[k]
	end
} )

function Core.ToggleMinimapAttached(self)
	if FuBar and not self.cannotAttachToMinimap then
		local value = self:IsMinimapAttached()
		if value then
			if self.panel then
				self.panel:RemovePlugin(self)
			end
			if self.defaultPosition == "MINIMAP" then
				FuBar:GetPanel(1):AddPlugin(self, nil, "LEFT")
			else
				FuBar:GetPanel(1):AddPlugin(self, nil, self.defaultPosition)
			end
		else
			if self.panel then
				self.panel:RemovePlugin(self)
			end
			Panel:AddPlugin(self)
		end
	end
	local Dewdrop = Core.optLibs["Dewdrop-2.0"]
	if Dewdrop then
		Dewdrop:Close()
	end
end

function Core.Show(self, panelId)
	if panelId == 0 then
		panelId = -1
	end
	Core.orig.Show(self,panelId)
end

function Core.IsMinimapAttached(self)
	if not FuBar then return true end
	return self.panel == Panel
end

function Core.HookMinimap(plugin)
	Core.SmartHook(plugin, "ToggleMinimapAttached")
	Core.SmartHook(plugin, "IsMinimapAttached")
	Core.SmartHook(plugin, "Show")
end

function Core.UnhookMinimap(plugin)
	Core.SmartUnhook(plugin, "ToggleMinimapAttached")
	Core.SmartUnhook(plugin, "IsMinimapAttached")
	Core.SmartUnhook(plugin, "Show")
end

function Core.IsMinimapHooked(plugin)
	return ( plugin.ToggleMinimapAttached == Core.ToggleMinimapAttached )
end

-- case 1 : plugin[method] == orig[method] -> not yet hooked.
-- case 2 : plugin[method] == Panel[method] -> already hooked.
-- case 3 : plugin[method] ~= both -> plugin has a custom defined method. ( do not touch it)

function Core.SmartHook(plugin, method)
	if plugin[method] == Core.orig[method] then
		plugin[method] = Core[method]
	end
end

function Core.SmartUnhook(plugin, method)
	if plugin[method] == Core[method] then
		plugin[method] = Core.orig[method]
	end
end




--[[-------------------------------------------------------------------------
	Combined Conversion.
---------------------------------------------------------------------------]]


function Core.Convert(plugin)
	
	local AceOO = Core.optLibs["AceOO-2.0"]
	if not AceOO or not AceOO.inherits(plugin, "FuBarPlugin-2.0") then
		return false
	end
	
	if Core.IsMinimapHooked(plugin) then
		return false
	end
	
	local isMinimapAttached = plugin:IsMinimapAttached()
	
	Core.HookMinimap(plugin)
	
	-- assumption: if origIsMinimapAttached == true then hookedIsMinimapAttached == false
	if isMinimapAttached then
		if not FuBar then
			if plugin.panel then
				plugin.panel:RemovePlugin(plugin)
			end
			Panel:AddPlugin(plugin)
		else
			plugin:ToggleMinimapAttached()
		end
	end
	
end

function Core.Unconvert(plugin)

	if not Core.IsMinimapHooked(plugin) then
		return false
	end
	
	Core.UnhookMinimap(plugin)

	local currMinimapFrame = plugin.minimapFrame
	local buttonId = Core.GetUniqueId(plugin)
	local button = nSideBar.GetButton(buttonId)

	if not currMinimapFrame or button ~= currMinimapFrame then
		return
	end
	
	local isShown = button:IsShown()

	-- RemovePlugin() to restore the minimapFrame first, so plugin:Show(0) works.
	Panel:RemovePlugin(plugin)
	
	if isShown or not FuBar then
		plugin:Show(0)
	else
		FuBar:GetPanel(1):AddPlugin(plugin)
	end
	
end



--[[-------------------------------------------------------------------------
	FuBarPlugin Instance Detection
---------------------------------------------------------------------------]]

-- Since FuBarPlugin-2.0 might be loaded after FBP2SlideBar when embedded, a delayed detection is required.

function Core.DetectNewPlugins()
	local FuBarPlugin = Core.optLibs["FuBarPlugin-2.0"]
	if FuBarPlugin and not Core.newPlugins then
		Core.newPlugins = {}
		
		-- Make use of FuBarPlugin.OnInstanceInit to detect new plugins.

		function Core.OnInstanceInit(FuBarPlugin, target, ...)
			Core.origOnInstanceInit(FuBarPlugin, target, ...)
			
			-- FuBarPlugin.OnInstanceInit calls debugstack(),
			--  which the contents change after hooking, so I have to explicitly fix it here.
			local folderName
			for i = 6, 3, -1 do
				folderName = debugstack(i, 1, 0):match("\\AddOns\\(.*)\\")
				if folderName then
					break
				end
			end
			target.folderName = folderName
			FuBarPlugin.folderNames[target] = folderName
			
			table.insert(Core.newPlugins, target)
			Core.ScheduleSetup()
		end
		
		Core.origOnInstanceInit = FuBarPlugin.OnInstanceInit
		FuBarPlugin.OnInstanceInit = Core.OnInstanceInit

		Core.origOnManualEmbed = FuBarPlugin.OnManualEmbed
		FuBarPlugin.OnManualEmbed = Core.OnInstanceInit

	end
end


--[[-------------------------------------------------------------------------
Interaction with FuBar
---------------------------------------------------------------------------]]

-- FuBar should always load before FBP2Slidebar since OptionalDeps is set.

if _G["FuBar"] then
	Core.newFuBarPlugins = {}
	FuBar = _G["FuBar"]
	
	-- Hook ShowPlugin right away,
	Core.origFuBarShowPlugin = FuBar.ShowPlugin
	function Core.ShowPlugin(self, plugin, panelId, ...)
		if panelId == -1 then
			Panel:AddPlugin(plugin)
		else
			Core.origFuBarShowPlugin(FuBar, plugin, panelId, ...)
		end
	end
	FuBar.ShowPlugin = Core.ShowPlugin
end


--[[-------------------------------------------------------------------------
	Initialization
---------------------------------------------------------------------------]]

-- Begin actual initialization at 2 seconds after PLAYER_ENTERING_WORLD.

function Core.OnUpdate(frame,elapsed)
	frame.timer = frame.timer + elapsed
	if frame.timer > 2 then
		Core.ConvertAll()
		frame:Hide()
	end
end
function Core.OnEvent(frame)
	frame:UnregisterAllEvents()
	Core.ScheduleSetup()
end
function Core.ScheduleSetup()
	Core.frame.timer = 0
	Core.frame:Show()
end

Core.frame = CreateFrame("Frame")
Core.frame:SetScript("OnUpdate", Core.OnUpdate)
Core.frame:SetScript("OnEvent", Core.OnEvent)
Core.frame:RegisterEvent("PLAYER_ENTERING_WORLD")

Core.config = _G["FBP2SlideBarConfig"]
function Core.ShouldConvert(plugin)
	if Core.config then
		local pluginId = Core.GetUniqueId(plugin)
		for i, pluginName in ipairs(Core.config.doNotConvert) do
			if pluginName == pluginId then
				return false
			end
		end
	end
	return true
end

function Core.ConvertAll()
	if Core.newPlugins then
		for i, plugin in ipairs(Core.newPlugins) do
			if Core.ShouldConvert(plugin) then
				Core.Convert(plugin)
			end
		end
	else
		local FuBarPlugin = Core.optLibs["FuBarPlugin-2.0"]
		if FuBarPlugin and FuBarPlugin.registry then
			for plugin in pairs(FuBarPlugin.registry) do
				if Core.ShouldConvert(plugin) then
					Core.Convert(plugin)
				end
			end
			Core.DetectNewPlugins()
		end
	end
end


