--[[
	scmSettings: Configure some simple chat settings on load.
--]]

local scmSettings = {

	logging = {
		chat = true,
		combat = false,
	},
	
	sticky = {
--		SAY = 1,
--		WHISPER = 1,
--		YELL = 1,
--		PARTY = 1,
--		GUILD = 1,
--		OFFICER = 1,
--		RAID = 1,
		RAID_WARNING = 1,
--		BATTLEGROUND = 1,
		CHANNEL = 1,
--		EMOTE = 0,	
	},

}



function scmSettings:Enable()

	-- Logging.

	local isLogging
	isLogging = LoggingChat(self.logging.chat)
	if isLogging then
		DEFAULT_CHAT_FRAME:AddMessage("scmSettings: Chat is now being logged to Logs\\WOWChatLog.txt")
	else
		DEFAULT_CHAT_FRAME:AddMessage("scmSettings: Chat will NOT be logged")
	end
	
	isLogging = LoggingCombat(self.logging.combat)
	if isLogging then
		DEFAULT_CHAT_FRAME:AddMessage("scmSettings: Combat is now being logged to Logs\\WoWCombatLog.txt")
	else
		DEFAULT_CHAT_FRAME:AddMessage("scmSettings: Combat will NOT be logged.")
	end
	
	
	-- Sticky.
	
	for channel, flag in pairs(self.sticky) do
		ChatTypeInfo[channel].sticky = flag
	end
	
end


scmSettings:Enable()