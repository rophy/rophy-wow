--[[
	TinyQueue : LightQueue made Tiny.
]]

local L = {
	["Recieved StinkyQueue message from %s, Joining..."] = true,
	["Sending StinkyQueue message to Raid."] = true,
}

--[[ Initialization ]]--

-- Receive Message.
local frame = CreateFrame("Frame")
frame:SetScript("OnEvent", function(frame,event,prefix,message,messageType,player)
	if prefix == "StinkyQ" and message == "Queue" and messageType ~= "GUILD" then
		JoinBattlefield(0)
		ChatFrame1:AddMessage(L["Recieved StinkyQueue message from %s, Joining..."]:format(player),0,1,0)
	end
end)
frame:RegisterEvent("CHAT_MSG_ADDON")

-- Send Message.
_G["SlashCmdList"]["TINYQUEUE"] = function(msg)
	SendAddonMessage("StinkyQ", "Queue", "RAID")
	SendAddonMessage("StinkyQ", "Queue", "WHISPER", UnitName("player"))
	ChatFrame1:AddMessage(L["Sending StinkyQueue message to Raid."],0,1,0)
end
_G["SLASH_TINYQUEUE1"] = "/q"

-- Locales
for k,v in pairs(L) do
	if v == true then
		L[k] = k
	end
end
