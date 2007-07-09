--[[
	TinyQueue : Tiny StinyQueue-compatible AV group queue addon, based on LightQueue by Funkydude.
]]

local L = {
	["Recieved StinkyQueue message from %s, Joining..."] = "Recieved StinkyQueue message from %s, Joining...",
	["Sending StinkyQueue message to Raid."] = "Sending StinkyQueue message to Raid.",
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
	ChatFrame1:AddMessage(L["Sending StinkyQueue message to Raid."],0,1,0)
end
_G["SLASH_TINYQUEUE1"] = "/q"

