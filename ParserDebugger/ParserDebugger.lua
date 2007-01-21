
local parser = ParserLib:GetInstance("1.1")

ParserConsole = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceDebug-2.0", "AceConsole-2.0")

function ParserConsole:OnInitialize()

	if not ParserDebuggerDB then 
		ParserDebuggerDB = {
			frame = 3,
--			alldata = false,
		} 		
	end
	
	self.db = ParserDebuggerDB

	self:RegisterChatCommand( { "/pc" }, {
		type = 'group',
		args = {
			help = {	
				type = 'execute',
				name = 'help',
				desc = "Shows basic usage about this addon.",
				func = function() self:ShowHelp() end,
			},
			frame = {
				type = 'text',
				name = 'frame',
				desc = "Specifies which frame to display the warning message.",
				get = function() return self.db.frame end,
				set = function(id) 
					self.db.frame = tonumber(id)
					self.printFrame = getglobal("ChatFrame"..id)
				end,
-- 				input = true, 	-- dunno why, this isn't working.
				validate = { '1', '2', '3', '4', '5', '6', '7' },
				usage = "<ChatFrame ID>",
			},
			alldata = {
				type = 'toggle',
				name = 'alldata',
				desc = "Toggle caching of all ParserLib events or just those with unknown info.type",
				get = function() return self.db.alldata end,
				set = function(flag) self.db.alldata = flag end
			}
		}
	} )

	for i, bEvent in ipairs(parser.supportedEvents) do 
		parser:RegisterEvent("ParserConsole", bEvent, function(event, info) self:OnCombatEvent(event, info) end)
	end

	self.cache = CircularQueue:new(5)
	

	parser.debug = true
	local eventTable = parser:GetEventTable()
	local patternCounter = {}
	for event, list in pairs(eventTable) do
		patternCounter[event] = {}
		for i, pattern in ipairs(list) do
			patternCounter[event][pattern] = 0
		end
	end
	self.db.counter = patternCounter
	
	
end

function ParserConsole:OnCombatEvent(bEvent, info)
	
	local pattern = info.pattern
	if info.type == 'unknown' then
		self:CustomPrint(1,1,1, nil, nil, nil, "Unknown:", bEvent, info.message)
	else
		self.db.counter[bEvent][pattern] = self.db.counter[bEvent][pattern] + 1
	end
	


	if self.db.alldata or info.type == 'unknown' then
	
		local clonedInfo = {}
		for k, v in pairs(info) do
			clonedInfo[k] = v
		end
		
		local data = {
			bEvent = bEvent,
			arg1 = getglobal("arg1"),
			info = clonedInfo
		}
		
		self.cache:Push( data  )
		
		
	end
	
	
end


function ParserConsole:ShowHelp()
	self:Print("when an ParserLib event with info.type == 'unknown' is encountered, a red message will be displayed on the specified ChatFrame (defaults to 3), and all the related information will be stored in a cache. You may get the content of the cache by callng ParserConsole:Dump(), which returns a list, then use something like tekProber to view its content.")
end

function ParserConsole:Dump()
	return self.cache:ToList()
end

