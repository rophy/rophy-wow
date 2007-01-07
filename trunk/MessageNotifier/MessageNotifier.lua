MessageNotifier = {}

MessageNotifier.sound = "Interface\\AddOns\\MessageNotifier\\incoming.mp3"

function MessageNotifier:OnLoad()

	self.playerName = UnitName('player')

	for i=1, 7, 1 do
		local frame = getglobal( 'ChatFrame' .. i )
		if frame then
			hooksecurefunc(frame, 'AddMessage', function(frame, text, r, g, b, a) MessageNotifier:AddMessage(i, text, r, g, b, a) end )
		end
	end
	
	MessageNotifierFrame:SetScale(2.0)
	
	-- Slash commands.
	SLASH_MessageNotifier1 = "/popup";
	SlashCmdList["MessageNotifier"] = function() self:OnSlashCommand(cmd) end
	
	table.insert(UISpecialFrames, "MessageNotifierFrame")
	
	
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
	self.enabled = not self.enabled
	if self.enabled then
		DEFAULT_CHAT_FRAME:AddMessage("MessageNotifier enabled.", 0, 0, 1)
	else
		DEFAULT_CHAT_FRAME:AddMessage("MessageNotifier disabled.", 0, 0, 1)
	end
end

function MessageNotifier:AddMessage(id, text, r, g, b, a)

	if not self.enabled then return end
	
	if getglobal('event') == 'CHAT_MSG_WHISPER' or string.find(text, self.playerName, 1, true) then
		MessageNotifierFrame:AddMessage('[' .. id .. ']' .. text, r, g, b, a)
		if not MessageNotifierFrame:IsShown() then
			MessageNotifierFrame:Show()
		end
	end
	
end
