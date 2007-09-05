function Include(path)
	local module = assert(loadfile(path))
	module()
end


Include("WoWAPI.lua")


-- Pick one, non-english GlobalString file will overwrite function GetLocale(), so you must load this after WoWAPI.lua
Include("GlobalStrings-zhTW.lua")
-- Include("GlobalStrings-enUS.lua")

Include("../ParserCore-1/ParserCore-1.lua")







local parser = LibStub:GetLibrary("ParserCore-1")

parser:LoadEverything()
local eventMap,_,_,_,_,OnEvent = parser:GetInternals()
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
	parser:RegisterEvent("Test", event, EventHandler)
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
		assert(_G[cache.p]==_G[pattern], string.format("%s: %s, %s [%s]", event, cache.p, pattern,message))
		assert(_G[cache.p]:format(unpack(cache))==message, cache.p)
	end
end

-- Test for unknown messages.
parser:RegisterEvent("Test", "_EVENT_PARSE_FAILED", UnknownEventHandler)
local actualEvent,actualMessage = "CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS","This is a new message"
OnEvent(nil,actualEvent,actualMessage)
assert(actualEvent==returnEvent, string.format("Event: %s->%s",tostring(actualEvent),tostring(returnEvent)))
assert(actualMessage==returnMessage, string.format("Message: %s->%s",tostring(actualMessage),tostring(returnMessage)))
