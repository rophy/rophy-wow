

local core = KombatMeters

local Report = core:NewModule("Report")
local CT = ChatThrottleLib

function Report:Enable()
	local cmd = core.cmd
	cmd:RegisterSlashHandler("report {s|p|r|g|h|w} [name|channel]", "report (.+) ?(.-)", function(chatType,channel) self:Report(chatType,channel) end)
end

function Report:Report(chatType,channel)
	local showType = KombatMeters:GetShownValueType()
	if not showType then
		self:Print("Nothing to report.")
		return
	end
	if not KombatMeters.data[showType] then
		self:Print("No data.")
		return
	end

	self:Print(chatType or "NIL!")

	
	if chatType == "s" then
		chatType = "SAY"
	elseif chatType == "h" then
		chatType = "CHANNEL"
	elseif chatType == "g" then
		chatType = "GUILD"
	elseif chatType == "p" then
		chatType = "PARTY"
	elseif chatType == "r" then
		chatType = "RAID"
	elseif chatType == "w" then
		chatType = "WHISPER"
	end
	
	
	local msg
	local total = 0
	msg = showType
	CT:SendChatMessage("NORMAL", "KombatMeters_Report", msg, chatType, nil, channel)
	local index = KombatMeters:GetSortedDataIndexes(showType)
	local data = KombatMeters:GetDataTable(showType)
	for i, name in ipairs(index) do
		local value = data[name]
		msg = string.format("#1: %s = %d", name, value)
		total = total + value
		CT:SendChatMessage("NORMAL", "KombatMeters_Report", msg, chatType, nil, channel)
	end
	msg = string.format("Total = %d", total)
	CT:SendChatMessage("NORMAL", "KombatMeters_Report", msg, chatType, nil, channel)
end

