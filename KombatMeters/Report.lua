

local core = KombatMeters

local Report = core:NewModule("Report")
local CT = ChatThrottleLib

function Report:Enable()
	local cmd = core.cmd
	cmd:RegisterSlashHandler("report valueType {s|p|r|g|h|w} [name|channel]", "^report (%a+) (%a+) ?(.-)$", function(valueType,chatType,channel) self:Report(valueType,chatType,channel) end)
end

function Report:Report(valueType,chatType,channel)
	local showType = valueType
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
		if not channel or channel == "" then
			self:Print("/km report h : missing channel name")
			return
		end
		chatType = "CHANNEL"
	elseif chatType == "g" then
		chatType = "GUILD"
	elseif chatType == "p" then
		chatType = "PARTY"
	elseif chatType == "r" then
		chatType = "RAID"
	elseif chatType == "w" then
		if not channel or channel == "" then
			self:Print("/km report w : missing player name")
			return
		end
		chatType = "WHISPER"
	else
		-- unknown chatType
		return
	end
	
	
	local msg
	local total = 0
	msg = showType
	CT:SendChatMessage("NORMAL", "KombatMeters_Report", msg, chatType, nil, channel)
	local index = KombatMeters:GetSortedDataIndexes(showType)
	local data = KombatMeters:GetDataTable(showType)
	if not index or not data then
		self:Print("Value type " .. tostring(valueType) .. " not found.")
		return
	end
	for i, name in ipairs(index) do
		local value = data[name]
		msg = string.format("#%d: %s = %d", i, name, value)
		total = total + value
		CT:SendChatMessage("NORMAL", "KombatMeters_Report", msg, chatType, nil, channel)
	end
	msg = string.format("Total = %d", total)
	CT:SendChatMessage("NORMAL", "KombatMeters_Report", msg, chatType, nil, channel)
end

