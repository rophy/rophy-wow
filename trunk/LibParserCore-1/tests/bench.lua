local function Include(path)
	local module = assert(loadfile(path))
	module()
end

local parser
local gcMem,totalMem


Include("WoWAPI.lua")

-- PIck one.
Include("GlobalStrings-enUS.lua")

-- Pick one.
Include("43K_CombatLog.lua")
-- Include("10K_CombatLog.lua")


local function BeginRecordMemory()
	collectgarbage()
	collectgarbage()
	totalMem = collectgarbage('count')
	mem = collectgarbage('count')
end

local function EndRecordMemory()
	totalMem = collectgarbage('count') - totalMem
	collectgarbage()
	collectgarbage()
	mem = collectgarbage('count') - mem
end

local function ReportMemory(title)
	print(string.format("Mem [%s] : %.3fKB, %.3fKB",title,mem,totalMem))
end


BeginRecordMemory()
Include("../ParserCore-1/ParserCore-1.lua")
parser = LibStub("ParserCore-1")
EndRecordMemory()
ReportMemory("Load")




local OnEvent,Initialize,GenerateEventMap,GenerateKeywords = select(6,parser:GetInternals())

BeginRecordMemory()
GenerateEventMap()
EndRecordMemory()
ReportMemory("eventMap")

BeginRecordMemory()
GenerateKeywords()
EndRecordMemory()
ReportMemory("keywords")


BeginRecordMemory()
parser:LoadEverything()
EndRecordMemory()
ReportMemory("patternInfo")


local eventMap = parser:GetInternals()

local parsed = 0
local function OnCombatEvent(event,...)
	parsed = parsed + 1
end


for event in pairs(eventMap) do
	parser:RegisterEvent("ParserBench", event, OnCombatEvent)
end

local eventSize = #NURFED_SAVED_LOGS.e

BeginRecordMemory()
local timer = os.clock()
for i=1, eventSize, 1 do
	local event = NURFED_SAVED_LOGS.e[i]
	local arg1 = NURFED_SAVED_LOGS.s[i]
	OnEvent(nil,event,arg1)
end
timer = os.clock() - timer
EndRecordMemory()
ReportMemory("simulation")

print( string.format("Benchmark completed for %d events in %.3fs (%.3fms/event) ", parsed, timer, timer*1000/parsed) )

