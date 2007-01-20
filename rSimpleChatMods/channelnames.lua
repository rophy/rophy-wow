Channelnames = AceLibrary("AceAddon-2.0"):new("AceHook-2.1")

local _G = getfenv(0)


local REGEX = 1
local REPLACE = 2
local eventRegExMap = {
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


function Channelnames:OnEnable()
	for i = 1, 7 do
		self:Hook(_G["ChatFrame"..i], "AddMessage")
	end
end

function Channelnames:AddMessage(frame, text, r, g, b, id)
	local map = eventRegExMap[event]
	if map and type(text) == "string" then		
		text = text:gsub(map[REGEX], map[REPLACE])
	end
	return self.hooks[frame].AddMessage(frame, text, r, g, b, id)
end

