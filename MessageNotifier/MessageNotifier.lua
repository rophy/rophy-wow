MessageNotifier = {}

-- A list of supported events.
local events = {
	CHAT_MSG_BATTLEGROUND = true,
	CHAT_MSG_BATTLEGROUND_LEADER = true,
	CHAT_MSG_CHANNEL = true,
	CHAT_MSG_EMOTE = true,
	CHAT_MSG_GUILD = true,
	CHAT_MSG_MONSTER_EMOTE = true,
	CHAT_MSG_MONSTER_SAY = true,
	CHAT_MSG_MONSTER_WHISPER = true,
	CHAT_MSG_MONSTER_YELL = true,
	CHAT_MSG_OFFICER = true,
	CHAT_MSG_PARTY = true,
	CHAT_MSG_RAID = true,
	CHAT_MSG_RAID_BOSS_EMOTE = true,
	CHAT_MSG_RAID_LEADER = true,
	CHAT_MSG_RAID_WARNING = true,
	CHAT_MSG_SAY = true,
	CHAT_MSG_TEXT_EMOTE = true,
	CHAT_MSG_WHISPER = true,
	CHAT_MSG_YELL = true,
}

MessageNotifier.sound = "Interface\\AddOns\\MessageNotifier\\incoming.mp3"

function MessageNotifier:OnLoad()

	self.playerName = UnitName('player'):lower()

	for i=1, 7, 1 do
		local frame = getglobal( 'ChatFrame' .. i )
		if frame then
			hooksecurefunc(frame, 'AddMessage', function(frame, text, r, g, b, a) MessageNotifier:AddMessage(i, text, r, g, b, a) end )
		end
	end
	
	MessageNotifierFrame:SetScale(2.0)
	
	-- Slash commands.
	SLASH_MessageNotifier1 = "/mn";
	SlashCmdList["MessageNotifier"] = function() self:OnSlashCommand(cmd) end
	
	table.insert(UISpecialFrames, "MessageNotifierFrame")
	
	this:RegisterEvent("VARIABLES_LOADED")
end

function MessageNotifier:OnEvent()
	if event == "VARIABLES_LOADED" then
		self:Initialize()		
	end
end

function MessageNotifier:Initialize()

	if not MessageNotifierDB then	
		MessageNotifierDB = {}
	end
	self.db = MessageNotifierDB	
end

function MessageNotifier:OnHide()
	self.timer = nil
	MessageNotifierFrame:Clear()
end

function MessageNotifier:OnUpdate(elapsed)
	if not self.timer then 
		self.timer = 0 
	end
	self.timer = self.timer - elapsed
	if self.timer < 0 then
		PlaySoundFile(self.sound)
		self.timer = 3
	end
end

function MessageNotifier:OnSlashCommand(msg)
	self.db.enabled = not self.db.enabled
	if self.db.enabled then
		DEFAULT_CHAT_FRAME:AddMessage("MessageNotifier enabled.", 0, 0, 1)
	else
		DEFAULT_CHAT_FRAME:AddMessage("MessageNotifier disabled.", 0, 0, 1)
	end
end

function MessageNotifier:AddMessage(id, text, r, g, b, a)

	if not self.db or not self.db.enabled then return end
	
	local event = getglobal('event')
	
	if not events[event] then return end
	
	if event == 'CHAT_MSG_WHISPER' 
	or event == 'CHAT_MSG_MONSTER_WHISPER'
	or string.find(text:lower(), self.playerName, 1, true) then
	
		MessageNotifierFrame:AddMessage('[' .. id .. ']' .. text, r, g, b, a)
		
		if not MessageNotifierFrame:IsShown() then
			MessageNotifierFrame:Show()
		end
		
	end
	
end
