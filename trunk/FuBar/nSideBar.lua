
local FuBarPlugin = AceLibrary("FuBarPlugin-2.0")
local nSideBar = LibStub("nSideBar")
local FuBar = _G["FuBar"]

if not FuBar then error("NoFuBar") end

local core = FuBar.core

--[[
local NSBMap = {}
FuBar.nSideBarMapper = NSBMap

function NSBMap.IsButtonPlugin(plugin)
	return ( not plugin.OnTextUpdate and plugin.UpdateText == FuBarPlugin.UpdateText )
end

function NSBMap.RegisterPlugin(plugin)
	if not NSBMap.IsButtonPlugin(plugin) then
		return false
	end
	NSBMap.Convert(plugin)
	return true
end

local GetAnchorFrame
do
	local anchorFrame
	
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

	function GetAnchorFrame(frame)
		if not anchorFrame then
			anchorFrame = CreateFrame("Frame")
			anchorFrame:SetWidth(3)
			anchorFrame:SetHeight(3)
		end
		local xOff, yOff, anchor = GetPoints(frame)
		anchorFrame:SetPoint(anchor or "CENTER", UIParent, anchor or "CENTER", xOff, yOff)
		return anchorFrame
	end
end



local scriptsToMap = { "OnMouseDown", "OnMouseUp", "OnDoubleClick", "OnClick", "OnEnter", "OnLeave" }


function NSBMap.Convert(plugin)
	
	local iconPath = plugin.iconFrame and plugin.iconFrame:GetTexture()
	local button = nSideBar.AddButton(plugin:GetTitle(), iconPath)
	local pluginFrame = plugin.frame
	button.self = plugin
	
	for i, script in ipairs(scriptsToMap) do
		local pluginHandler = pluginFrame:GetScript(script)
		if pluginHandler then
			local buttonHandler = button:GetScript(script)
			if buttonHandler then
				button:SetScript(script, function(...)
					buttonHandler(...)
					pluginHandler(...)
				end)
			else
				button:SetScript(script, pluginHandler)
			end
		end
	end
	
	-- Special handler for "OnMouseDown" to fix dewdrop menu anchoring.
	local pluginHandler = pluginFrame:GetScript("OnMouseDown")
	if pluginHandler then
		local function frame_OnMouseDown(frame, arg1)
			if arg1 == "RightButton" and not IsModifierKeyDown() then
				frame.self:OpenMenu(GetAnchorFrame(button))
			else
				pluginHandler(frame,arg1)
			end
		end
		local buttonHandler = button:GetScript("OnMouseDown")
		if buttonHandler then
			button:SetScript("OnMouseDown", function(...)
				buttonHandler(...)
				frame_OnMouseDown(...)
			end)
		else
			button:SetScript("OnMouseDown", frame_OnMouseDown)
		end
	end
	
	plugin.frame = button
	
	plugin.CheckWidth = function() end
end

]]

-- A proper FuBarPanel should support the following methods:
-- AddPlugin RemovePlugin GetNumPlugins GetPlugin HasPlugin GetPluginSide UpdateCenteredPosition SetPluginSide GetAttachPoint

local nSideBarPanel = {
	plugins = {}
}

function nSideBarPanel:AddPlugin(plugin)
	local oldPanel = plugin:GetPanel()
	if oldPanel and oldPanel ~= self then
		oldPanel:RemovePlugin(plugin)
	end
	plugin:SetPanel(self)
	table.insert(self.plugins,pugin)
	self:ConvertMinimapFrame(plugin)
	plugin:Update()
end

-- The actual API is RemovePlugin(index, side), but index can be either 'plugin index' or 'plugin object'.
-- FuBarPlugin-2.0 only pass 'plugin object'.
function nSideBarPanel:RemovePlugin(plugin)
	if type(plugin) ~= 'table' then
		return
	end
	for i, iPlugin in ipairs(self.plugins) do
		if plugin == iPlugin then
			table.remove(self.plugins,i)
			break
		end
	end
	if plugin:GetPanel() == nSideBarPanel then
		self:RestoreMinimapFrame(plugin)
	end
	plugin:SetPanel(nil)
	return true
end

function nSideBarPanel:GetNumPlugins()
	return 0
end

function nSideBarPanel:GetPlugin(index, side)
	return nil
end

function nSideBarPanel:HasPlugin(plugin)
	return false
end

function nSideBarPanel:GetPluginSide(plugin)
	return "LEFT"
end

function nSideBarPanel:SetPluginSide(plugin, side)

end

function nSideBarPanel:UpdateCenteredPosition()

end

local origFrames = {}
local origMinimapFrames = {}
function GetOrigMinimapFrames()
	return origMinimapFrames
end

function nSideBarPanel:ConvertMinimapFrame(plugin)
	if plugin.minimapFrame and plugin.minimapFrame.isnsb then
		return
	end
	origMinimapFrames[plugin] = plugin.minimapFrame
	
	local iconPath = plugin.iconFrame and plugin.iconFrame:GetTexture() or "Interface\\Icons\\INV_Misc_QuestionMark"
	local button = nSideBar.AddButton(plugin:GetTitle(), iconPath)
	
	if not button.isnsb then
		local pluginFrame = plugin.frame
		button.self = plugin
		button.isnsb = true
		
		for i, script in ipairs(scriptsToMap) do
			local pluginHandler = pluginFrame:GetScript(script)
			if pluginHandler then
				local buttonHandler = button:GetScript(script)
				if buttonHandler then
					button:SetScript(script, function(...)
						buttonHandler(...)
						pluginHandler(...)
					end)
				else
					button:SetScript(script, pluginHandler)
				end
			end
		end
		
		-- Special handler for "OnMouseDown" to fix dewdrop menu anchoring.
		local pluginHandler = pluginFrame:GetScript("OnMouseDown")
		if pluginHandler then
			local function frame_OnMouseDown(frame, arg1)
				if arg1 == "RightButton" and not IsModifierKeyDown() then
					frame.self:OpenMenu(GetAnchorFrame(button))
				else
					pluginHandler(frame,arg1)
				end
			end
			local buttonHandler = button:GetScript("OnMouseDown")
			if buttonHandler then
				button:SetScript("OnMouseDown", function(...)
					buttonHandler(...)
					frame_OnMouseDown(...)
				end)
			else
				button:SetScript("OnMouseDown", frame_OnMouseDown)
			end
		end
		
		local Tablet = AceLibrary:HasInstance("Tablet-2.0") and AceLibrary("Tablet-2.0")
		
		if not plugin.blizzardTooltip and not plugin.overrideTooltip and Tablet then
			-- Note that we have to do this after :SetScript("OnEnter"), etc,
			-- so that Tablet-2.0 can override it properly.
			FuBarPlugin.RegisterTablet(plugin)
			Tablet:Register(button, plugin.frame)
		end
	end
	
	plugin.minimapFrame = button
	origFrames[plugin] = plugin.frame
	--plugin.frame = button
	
end

function nSideBarPanel:RestoreMinimapFrame(plugin)
	if not plugin.minimapFrame or not plugin.minimapFrame.isnsb then
		return
	end
	local button = plugin.minimapFrame
	nSideBar.RemoveButton(plugin:GetTitle())
	plugin.minimapFrame = origMinimapFrames[plugin]
	ChatFrame3:AddMessage('minimapFrame = ' .. tostring(origMinimapFrames[plugin]))
	--plugin.frame = origFrames[plugin]
end

local origToggleMinimapAttached = {}
local origIsMinimapAttached = {}

local hookedMinimap = false

function UnhookAllMinimaps()
	HookMinimap(FuBarPlugin)
	for i,plugin in pairs(FuBar.plugins) do
		HookMinimap(plugin)
	end
	hookedMinimap = false
end

function HookAllMinimaps()
	HookMinimap(FuBarPlugin)
	for i,plugin in pairs(FuBar.plugins) do
		HookMinimap(plugin)
	end
	hookedMinimap = true
end


SLASH_FPB2NSB1 = "/fpb2nsb"
SlashCmdList["FPB2NSB"] = function(msg)
	if hookedMinimap then
		UnhookAllMinimaps()
	else
		HookAllMinimaps()
	end
end

function NSB_ToggleMinimapAttached(self)
	if not self.cannotAttachToMinimap then
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
			nSideBarPanel:AddPlugin(self)
		end
	end
end
function NSB_IsMinimapAttached(self)
	if not FuBar then return true end
	-- Calling origIsMinimapAttached because some plugins might already attached to real minimap.
	return self.panel == nSideBarPanel or origIsMinimapAttached[self](self)
end

function HookMinimap(plugin)
	origToggleMinimapAttached[plugin] = plugin.ToggleMinimapAttached
	plugin.ToggleMinimapAttached = NSB_ToggleMinimapAttached
	origIsMinimapAttached[plugin] = plugin.IsMinimapAttached
	plugin.IsMinimapAttached = NSB_IsMinimapAttached
end

function UnhookMinimap(plugin)
	plugin.IsMinimapAttached = origIsMinimapAttached[plugin]
	plugin.ToggleMinimapAttached = origToggleMinimapAttached[plugin]
end

--HookAllMinimaps()