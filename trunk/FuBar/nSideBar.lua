
local FuBarPlugin = AceLibrary("FuBarPlugin-2.0")
local nSideBar = LibStub("nSideBar")
local FuBar = _G["FuBar"]

if not FuBar then error("NoFuBar") end

local Core = {}
FuBar.nSideBarMapper = Core

function Core.IsButtonPlugin(plugin)
	return ( not plugin.OnTextUpdate and plugin.UpdateText == FuBarPlugin.UpdateText )
end

function Core.RegisterPlugin(plugin)
	if not Core.IsButtonPlugin(plugin) then
		return false
	end
	Core.Convert(plugin)
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

function Core.Convert(plugin)
	
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


