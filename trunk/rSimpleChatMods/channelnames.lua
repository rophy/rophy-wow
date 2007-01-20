scmChannelnames = {}

scmChannelnames.eventRegexMap = {
	CHAT_MSG_RAID_LEADER = { "%[Raid Leader%]", "[RL]" },
	CHAT_MSG_RAID = { "%[Raid%]", "[R]" },
	CHAT_MSG_RAID_WARNING = { "%[Raid Warning%]", "[RW]" },
	CHAT_MSG_CHANNEL = { "%[(%d+)%.%s.-%]", "[%1]" },
	CHAT_MSG_BATTLEGROUND = { "%[Battleground%]", "[BG]" },
	CHAT_MSG_BATTLEGROUND_LEADER = { "%[Battleground Leader%]", "[BGL]" },
	CHAT_MSG_GUILD = { "%[Guild%]", "[G]" },
	CHAT_MSG_PARTY = { "%[Party%]", "[P]" },
	CHAT_MSG_OFFICER = { "%[Officer%]", "[O]" },
}


function scmChannelnames:Enable()
	
	local frame
	
	local scmAddMessage = function(frame, text, r, g, b, id)
		self:AddMessage(frame, text, r, g, b, id)
	end
	
	-- On first enble, save the reference to the original functions.
	if not self.hooks then
		self.hooks = {}
		for i = 1, 7 do
			frame = _G["ChatFrame"..i]
			self.hooks[frame] = frame.AddMessage
		end
	end

	-- Now hook the functions.	
	for i = 1, 7 do
		frame = _G["ChatFrame"..i]
		frame.AddMessage = scmAddMessage
	end
end

function scmChannelnames:Disable()
	for i = 1, 7 do
		local frame = _G["ChatFrame" .. i]
		frame.AddMessage = self.hooks[frame]
	end
end

function scmChannelnames:AddMessage(frame, text, r, g, b, id)
	local map = self.eventRegexMap[event]
	if map and type(text) == "string" then
		text = text:gsub(map[1], map[2])
	end
	return self.hooks[frame](frame, text, r, g, b, id)
end

scmChannelnames:Enable()
