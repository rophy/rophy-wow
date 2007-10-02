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


local Panel = {}

--[[-------------------------------------------------------------------------
	Utility Functions
---------------------------------------------------------------------------]]

local optLibs = setmetatable({}, {
	__index = function(t,k)
		local lib = AceLibrary and AceLibrary:HasInstance(k) and AceLibrary(k)
		t[k] = lib
		return lib
	end
})

function Panel.GetLibrary(major)
	return optLibs[major]
end

function Panel.GetUniqueId(plugin)
	return plugin.folderName or plugin:GetTitle()
end

do -- Panel.HasFuBar
	local good = nil
	function Panel.HasFuBar()
		if not good then
			good = _G["FuBar"] and true
		end
		return good
	end
end

--[[-------------------------------------------------------------------------
	FuBarPanel Emulation
---------------------------------------------------------------------------]]


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

	local button, buttonId = Panel.GetOrCreateButton(plugin)
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
	
	local button, buttonId = Panel.GetOrCreateButton(plugin)
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

local function AddButtonScript(button, script, handler)
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


function Panel.GetOrCreateButton(plugin)

	local buttonId = Panel.GetUniqueId(plugin)
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
				if type(this.self.OnEnter) == "function" then
					this.self:OnEnter()
				end
			end
		end
		AddButtonScript(frame, "OnEnter", frame_OnEnter)
		if not frame_OnLeave then
			function frame_OnLeave()
				if type(this.self.OnLeave) == "function" then
					this.self:OnLeave()
				end
			end
		end
		AddButtonScript(frame, "OnLeave", frame_OnLeave)
		if not frame_OnClick then
			function frame_OnClick()
				if this.self:IsMinimapAttached() and this.dragged then return end
				if type(this.self.OnClick) == "function" then
					this.self:OnClick(arg1)
				end
			end
		end
		AddButtonScript(frame, "OnClick", frame_OnClick)
		if not frame_OnDoubleClick then
			function frame_OnDoubleClick()
				if type(this.self.OnDoubleClick) == "function" then
					this.self:OnDoubleClick(arg1)
				end
			end
		end
		AddButtonScript(frame, "OnDoubleClick", frame_OnDoubleClick)
		if not frame_OnReceiveDrag then
			function frame_OnReceiveDrag()
				if (this.self:IsMinimapAttached() and not this.dragged) and type(this.self.OnReceiveDrag) == "function" then
					this.self:OnReceiveDrag()
				end
			end
		end
		AddButtonScript(frame, "OnReceiveDrag", frame_OnReceiveDrag)
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
		AddButtonScript(frame, "OnMouseDown", minimap_OnMouseDown)
		if not minimap_OnMouseUp then
			function minimap_OnMouseUp()
				if type(this.self.OnMouseUp) == "function" then
					this.self:OnMouseUp(arg1)
				end
			end
		end
		AddButtonScript(frame, "OnMouseUp", minimap_OnMouseUp)
		
		local Tablet = Panel.GetLibrary("Tablet-2.0")
		local FuBarPlugin = Panel.GetLibrary("FuBarPlugin-2.0")

		if FuBarPlugin and Tablet and not plugin.blizzardTooltip and not plugin.overrideTooltip then
			-- Note that we have to do this after :SetScript("OnEnter"), etc,
			-- so that Tablet-2.0 can override it properly.
			
			FuBarPlugin.RegisterTablet(plugin)
			Tablet:Register(button, plugin.frame)
		end

	end
	
	return button, buttonId

end

function Panel.IsMinimapFrameConverted(plugin)
	local currMinimapFrame = plugin.minimapFrame
	local buttonId = Panel.GetUniqueId(plugin)
	local button = nSideBar.GetButton(pluginId)
	return (currMinimapFrame and button == currMinimapFrame)
end

do -- Panel.GetAnchorFrame(frame)

	--[[ Positioning, code taken from WindowLib by Mikk]]--
	local function GetPoints(frame)
		local abs = math.abs
		local s = frame:GetScale()
		local x, y = frame:GetCenter()
		local right, left = frame:GetRight()*s, frame:GetLeft()*s
		local top, bottom = frame:GetTop()*s, frame:GetBottom()*s
		local pwidth, pheight = UIParent:GetWidth(), UIParent:GetHeight()
		x, y = x*s, y*s
		local xOff, yOff, anchor
		if left < (pwidth - right) and left < abs(x - pwidth/2) then
			xOff = left
			anchor = "LEFT"
		elseif (pwidth - right) < abs(x - pwidth/2) then
			xOff = right - pwidth
			anchor = "RIGHT"
		else
			xOff = x - pwidth/2
			anchor = ""
		end
		if bottom < (pheight - top) and bottom < abs(y - pwidth/2) then
			yOff = bottom
			anchor = "BOTTOM"..anchor
		elseif (pheight - top) < abs(y - pheight/2) then
			yOff = top - pheight
			anchor = "TOP"..anchor
		else
			yOff = y - pheight/2
		end

		if anchor == "" then
			anchor = "CENTER"
		end
		return xOff, yOff, anchor
	end

	function Panel.GetAnchorFrame(frame)
		if not Panel.anchorFrame then
			local anchorFrame = CreateFrame("Frame")
			anchorFrame:SetWidth(3)
			anchorFrame:SetHeight(3)
			Panel.anchorFrame = anchorFrame
		end
		
		local xOff, yOff, anchor = GetPoints(frame)
		Panel.anchorFrame:ClearAllPoints()
		Panel.anchorFrame:SetPoint(anchor or "CENTER", UIParent, anchor or "CENTER", xOff, yOff)
		return Panel.anchorFrame
	end
	
end



--[[-------------------------------------------------------------------------
	"Attach to minimap" Hooking
---------------------------------------------------------------------------]]

-- Automatic hooking of FuBarPlugin-2.0	
Panel.orig = setmetatable({}, {
	__index = function(t,k)
		local FuBarPlugin = Panel.GetLibrary("FuBarPlugin-2.0")
		t[k] = FuBarPlugin[k]
		FuBarPlugin[k] = Panel[k]
		return t[k]
	end
} )

function Panel.ToggleMinimapAttached(self)
	if Panel.HasFuBar() and not self.cannotAttachToMinimap then
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
	local Dewdrop = Panel.GetLibrary("Dewdrop-2.0")
	if Dewdrop then
		Dewdrop:Close()
	end
end

function Panel.Show(self, panelId)
	if panelId == 0 then
		panelId = -1
	end
	Panel.orig.Show(self,panelId)
end

function Panel.IsMinimapAttached(self)
	if not Panel.HasFuBar() then return true end
	return self.panel == Panel
end

function Panel.HookMinimap(plugin)
	Panel.SmartHook(plugin, "ToggleMinimapAttached")
	Panel.SmartHook(plugin, "IsMinimapAttached")
	Panel.SmartHook(plugin, "Show")
end

function Panel.UnhookMinimap(plugin)
	Panel.SmartUnhook(plugin, "ToggleMinimapAttached")
	Panel.SmartUnhook(plugin, "IsMinimapAttached")
	Panel.SmartUnhook(plugin, "Show")
end

function Panel.IsMinimapHooked(plugin)
	return ( plugin.ToggleMinimapAttached == Panel.ToggleMinimapAttached )
end

-- case 1 : plugin[method] == orig[method] -> not yet hooked.
-- case 2 : plugin[method] == Panel[method] -> already hooked.
-- case 3 : plugin[method] ~= both -> plugin has a custom defined method. ( do not touch it)

function Panel.SmartHook(plugin, method)
	if plugin[method] == Panel.orig[method] then
		plugin[method] = Panel[method]
	end
end

function Panel.SmartUnhook(plugin, method)
	if plugin[method] == Panel[method] then
		plugin[method] = Panel.orig[method]
	end
end




--[[-------------------------------------------------------------------------
	Combined Conversion.
---------------------------------------------------------------------------]]


function Panel.Convert(plugin)
	
	local AceOO = Panel.GetLibrary("AceOO-2.0")
	
	if not AceOO.inherits(plugin, "FuBarPlugin-2.0") then
		return false
	end
	
	if Panel.IsMinimapHooked(plugin) then
		return false
	end
	
	local isMinimapAttached = plugin:IsMinimapAttached()
	
	Panel.HookMinimap(plugin)
	
	-- assumption: if origIsMinimapAttached == true then hookedIsMinimapAttached == false
	if isMinimapAttached then
		plugin:ToggleMinimapAttached()
	end
	
end

function Panel.Unconvert(plugin)

	if not Panel.IsMinimapHooked(plugin) then
		return false
	end
	
	Panel.UnhookMinimap(plugin)

	local currMinimapFrame = plugin.minimapFrame
	local buttonId = Panel.GetUniqueId(plugin)
	local button = nSideBar.GetButton(buttonId)

	if not currMinimapFrame or button ~= currMinimapFrame then
		return
	end
	
	local isShown = button:IsShown()

	-- RemovePlugin() to restore the minimapFrame first, so plugin:Show(0) works.
	Panel:RemovePlugin(plugin)
	
	if isShown then
		plugin:Show(0)
	else
		FuBar:GetPanel(1):AddPlugin(plugin)
	end
	
end

function Panel.IsConverted(plugin)
	return Panel.IsMinimapFrameConverted(plugin) and Panel.IsMinimappHooked(plugin)
end



--[[-------------------------------------------------------------------------
Interaction with FuBar
---------------------------------------------------------------------------]]

-- FuBar should always load before FBP2Slidebar since OptionDependency is set.
-- Hook ShowPlugin right away,
if not Panel.origFuBarShowPlugin and Panel.HasFuBar() then
	Panel.newFuBarRegistry = {}
	local FuBar = _G["FuBar"]
	Panel.origFuBarShowPlugin = FuBar.ShowPlugin
	function Panel.ShowPlugin(self, plugin, panelId, ...)
		if panelId == -1 then
			Panel:AddPlugin(plugin)
		else
			Panel.origFuBarShowPlugin(FuBar, plugin, panelId, ...)
		end
	end
	FuBar.ShowPlugin = Panel.ShowPlugin
end



--[[-------------------------------------------------------------------------
	FuBarPlugin Instance Detection
---------------------------------------------------------------------------]]

-- Since FuBarPlugin-2.0 might be loaded after FBP2SlideBar when embedded,
--  a delayed detection is required.

function Panel.DetectNewPlugins()
	local FuBarPlugin = Panel.GetLibrary("FuBarPlugin-2.0")
	if FuBarPlugin and not Panel.newPlugins then
		Panel.newPlugins = {}
		
		-- Make use of FuBarPlugin.OnInstanceInit to detect new plugins.

		function Panel.OnInstanceInit(FuBarPlugin, target, ...)
			Panel.origOnInstanceInit(FuBarPlugin, target, ...)
			
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
			
			table.insert(Panel.newPlugins, target)
			Panel.ScheduleSetup()
		end
		
		Panel.origOnInstanceInit = FuBarPlugin.OnInstanceInit
		FuBarPlugin.OnInstanceInit = Panel.OnInstanceInit

		Panel.origOnManualEmbed = Panel.OnManualEmbed
		FuBarPlugin.OnManualEmbed = Panel.OnInstanceInit

	end
end


--[[-------------------------------------------------------------------------
	Plugin Initialization
---------------------------------------------------------------------------]]


local function TimerFunction(frame,elapsed)
	if not frame.timer then
		frame.timer = 0
	end
	frame.timer = frame.timer + elapsed
	if frame.timer > 2 then
		Panel.ConvertAll()
		frame:Hide()
	end
end

local frame = CreateFrame("Frame")
frame:SetScript("OnUpdate", TimerFunction)
frame:SetScript("OnEvent", function(frame)
	frame:UnregisterAllEvents()
	Panel.ScheduleSetup()
end )
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

function Panel.ScheduleSetup()
	frame:Show()
end


local config = _G["FBP2SlideBarConfig"]
function Panel.ShouldConvert(plugin)
	if config then
		local pluginId = Panel.GetUniqueId(plugin)
		for i, pluginName in ipairs(config.doNotConvert) do
			if pluginName == pluginId then
				return false
			end
		end
	end
	return true
end

function Panel.ConvertAll()
	if Panel.newPlugins then
		for i, plugin in ipairs(Panel.newPlugins) do
			if Panel.ShouldConvert(plugin) then
				Panel.Convert(plugin)
			end
		end
	else
		local FuBarPlugin = Panel.GetLibrary("FuBarPlugin-2.0")
		if FuBarPlugin and FuBarPlugin.registry then
			for plugin in pairs(FuBarPlugin.registry) do
				if Panel.ShouldConvert(plugin) then
					Panel.Convert(plugin)
				end
			end
			Panel.DetectNewPlugins()
		end
	end
end


