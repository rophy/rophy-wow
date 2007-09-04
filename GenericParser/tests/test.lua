function Include(path)
	local module = assert(loadfile(path))
	module()
end

Include("WoWAPI.lua")
Include("GlobalStrings.lua")
Include("../GenericParser.lua")

local Parser = LibStub:GetLibrary("LibParser")
local eventMap,patternInfo,keywords,frame,clients,OnEvent, Initialize = Parser:GetInternalTables()

Initialize()

local eventMap,patternInfo,keywords,frame,clients,OnEvent, Initialize = Parser:GetInternalTables()

local cache = {}
function EventHandler(event,message,pattern,...)
	cache.p = pattern
	for i=1, select('#',...) do
		cache[i] = select(i,...)
	end
end

local returnEvent,returnMessage
function UnknownEventHandler(event,unknownEvent,message)
	returnEvent = unknownEvent
	returnMessage = message
end

for event in pairs(eventMap) do
	Parser:RegisterEvent("Test", event, EventHandler)
end

-- Run through each event and each pattern.
for event, list in pairs(eventMap) do
	for i, pattern in ipairs(list) do
		local fmt = _G[pattern]
		assert(fmt, pattern)
		local count = 0
		local message = fmt:gsub("%%%d?%$?s", function(w)
			count = count + 1
			return string.rep('X',count)
		end):gsub("%%%d?%$?d", function(w)
			count = count + 1
			return count
		end)
		OnEvent(nil,event,message)
		assert(_G[cache.p]==_G[pattern], string.format("%s: %s, %s", event, cache.p, pattern))
		assert(_G[cache.p]:format(unpack(cache))==message, cache.p)
	end
end

-- Test for unknown messages.
Parser:RegisterEvent("Test", "_EVENT_PARSE_FAILED", UnknownEventHandler)
local actualEvent,actualMessage = "CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS","This is a new message"
OnEvent(nil,actualEvent,actualMessage)
assert(actualEvent==returnEvent, string.format("Event: %s->%s",tostring(actualEvent),tostring(returnEvent)))
assert(actualMessage==returnMessage, string.format("Message: %s->%s",tostring(actualMessage),tostring(returnMessage)))
