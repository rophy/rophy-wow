local _G = getfenv(0)

local NOT_CONVERTED = 0
local CONVERTED = 1

local WOW_VERSION = "2.0.6"

local frame = CreateFrame("Frame", "CombatLogScribeFrame")
frame:SetScript("OnEvent", function() CombatLogScribe:OnEvent() end )

CombatLogScribe = AceLibrary("AceAddon-2.0"):new("AceDebug-2.0", "AceConsole-2.0")

-- Patterns shorter than this will be considered 'too short' and will not be parsed.
CombatLogScribe.SHORT_PATTERN_LENGTH = 7

-- These are the patterns that you know for sure they're useless, to reduce pattern table size and parsing speed.
CombatLogScribe.ignoreList = {
	"ABILITY",
	"ABILITYBOOK_BUTTON",
	"ADDMEMBER",
	"ADD_RAID_MEMBER",
	"BACKGROUND",
	"^BAG_CANT_STACK",
	"^BINDING_",
	"^BUG",
	"CANT_AFFORD_ITEM",
	"CANT_USE_ITEM",
	"CHARACTER_BUTTON",
	"^CHAT_CHANNEL",
	"^CHAT_EMOTE",
	"^CHAT_FLAG",
	"^CHAT_MONSTER",
	"^COMBAT_RATING",
	"^COMBAT_TEXT",
	"COMMAND",
	"^CONFIRM",
	"^EMOTE",
	"FACTION_ALLIANCE",
	"FACTION_HORDE",
	"FACTION_INACTIVE",
	"FACTION_OTHER",
  "^FRIENDS",
	"^GENERIC",
	"^GUILD",
	"^GM",
	"^HELP",
  "^INVTYPE",
	"^ITEM_",
	"^KEY",
  "^MELEE",
	"^NEWBIE_TOOLTIP",
	"^OPTION_TOOLTIP",
	"^PVP",
	"^RESISTANCE",
	"^SLASH",
  "^SPELL_CAST",
  "SPELL_CRIT_CHANCE",
  "^SPELL_FAILED",
	"SPELL_SKILL_LINE",
	"SPELL_TARGET_TEMPLATE",
	"^TITLE_TEMPLATE",
	"^TUTORIAL",
	"UNKNOWNOBJECT",
	"UNKNOWN",
	"^VOICEMACRO",
};

CombatLogScribe.events = {
--	"CHAT_MSG_DND",
--	"CHAT_MSG_EMOTE",
--	"CHAT_MSG_GUILD",
--	"CHAT_MSG_IGNORED",
	"CHAT_MSG_LOOT",
	"CHAT_MSG_SKILL",
	"CHAT_MSG_SYSTEM",
	"CHAT_MSG_MONEY",
	"CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS",
	"CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES",
	"CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS",
	"CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES",
	"CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS",
	"CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES",
	"CHAT_MSG_COMBAT_ERROR",
	"CHAT_MSG_COMBAT_FACTION_CHANGE",
	"CHAT_MSG_COMBAT_FRIENDLYPLAYER_HITS",
	"CHAT_MSG_COMBAT_FRIENDLYPLAYER_MISSES",
	"CHAT_MSG_COMBAT_FRIENDLY_DEATH",
	"CHAT_MSG_COMBAT_HONOR_GAIN",
	"CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS",
	"CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES",
	"CHAT_MSG_COMBAT_HOSTILE_DEATH",
	"CHAT_MSG_COMBAT_MISC_INFO",
	"CHAT_MSG_COMBAT_PARTY_HITS",
	"CHAT_MSG_COMBAT_PARTY_MISSES",
	"CHAT_MSG_COMBAT_PET_HITS",
	"CHAT_MSG_COMBAT_PET_MISSES",
	"CHAT_MSG_COMBAT_SELF_HITS",
	"CHAT_MSG_COMBAT_SELF_MISSES",
	"CHAT_MSG_COMBAT_XP_GAIN",
	"CHAT_MSG_SPELL_AURA_GONE_OTHER",
	"CHAT_MSG_SPELL_AURA_GONE_SELF",
	"CHAT_MSG_SPELL_AURA_GONE_PARTY",
	"CHAT_MSG_SPELL_BREAK_AURA",
	"CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF",
	"CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE",
	"CHAT_MSG_SPELL_CREATURE_VS_PARTY_BUFF",
	"CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE",
	"CHAT_MSG_SPELL_CREATURE_VS_SELF_BUFF",
	"CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE",
	"CHAT_MSG_SPELL_DAMAGESHIELDS_ON_OTHERS",
	"CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF",
	"CHAT_MSG_SPELL_FAILED_LOCALPLAYER",
	"CHAT_MSG_SPELL_FRIENDLYPLAYER_BUFF",
	"CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE",
	"CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF",
	"CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE",
	"CHAT_MSG_SPELL_ITEM_ENCHANTMENTS",
	"CHAT_MSG_SPELL_PARTY_BUFF",
	"CHAT_MSG_SPELL_PARTY_DAMAGE",
	"CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS",
	"CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE",
	"CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS",
	"CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE",
	"CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS",
	"CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE",
	"CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS",
	"CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE",
	"CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS",
	"CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE",
	"CHAT_MSG_SPELL_PET_BUFF",
	"CHAT_MSG_SPELL_PET_DAMAGE",
	"CHAT_MSG_SPELL_SELF_BUFF",
	"CHAT_MSG_SPELL_SELF_DAMAGE",
	"CHAT_MSG_SPELL_TRADESKILLS",
}


local function ConvertPattern(pattern, anchor)

	pattern = string.gsub(pattern,"([%^%(%)%.%[%]%*%+%-%?])","%%%1") -- escape magic characters.
	pattern = string.gsub(pattern,"%%%d?%$?s","(.-)") -- %5$s to (.-)
	pattern = string.gsub(pattern,"%%%d?%$?d","(%%d+)") -- %$5d to (%d+)
	pattern = string.gsub(pattern,"%$","%%$")

	if anchor then pattern = "^"..pattern end
	
	-- If the pattern ends with (.-), replace it with (.+), or the capsule will be lost.
	if string.sub(pattern, -4) == "(.-)" then
		pattern = string.sub(pattern, 0, -5) .. "(.+)"
	end
		
	return pattern
		
end

function CombatLogScribe:OnInitialize()
	if not CombatLogScribeDB then 
		CombatLogScribeDB = {
			ignored = {},
			tooShort = {},
			events = {},
			ambiguous = {},
		}
	end

	self.db = CombatLogScribeDB

	-- Old version might not have this list.
	if not self.db.ambiguous then
		self.db.ambiguous = {}
	end
	
	local v, b, d = GetBuildInfo()
	self.build = v .. "." .. b
	
	
	self:LoadPatterns()
		
	self.ambiguousPatterns = self:FindAmbiguousPatterns(self.patterns.name)
	
	if not self.db.noConvertAmbiguous then
		for i, patternName in ipairs(self.db.ambiguous) do
			self:ConvertAmbiguousPattern(patternName)
		end
	end

	-- Convert patterns AFTER converting the ambiguous list.
	self:ConvertPatterns()

	self:LoadTrailers()
	
	-- nil out GetGlobalStringList() for gc.
	_G.GetGlobalStringList = nil


	
	self:RegisterCombatEvents()
	
	self:RegisterChatCommand( { "/cls" }, {
		type = 'group',
		args = {
			logcombat = {
				type = 'toggle',
				name = 'LogCombat',
				desc = 'Log detailed combat logs, this settings will not be saved.',
				get = function() return self.logCombat end,
				set = function(v) self.logCombat = v end,		
			},
			logtrailer = {
				type = 'toggle',
				name = 'LogTrailers',
				desc = 'Log trailer information for each pattern, this settings will be saved across sessions.',
				get = function() return self.db.logTrailer end,
				set = function(v) self.db.logTrailer = v end
			},
			convert = {
				type = 'toggle',
				name = 'Convert Ambiguous',
				desc = 'Modify ambiguous patterns on log in, so that the mod can distinguish the ambiguous 	patterns. This might kill other addons.',
				get = function() return not self.db.noConvertAmbiguous end,
				set = function(v) self.db.noConvertAmbiguous = v end
			},
			sleep = {
				type = 'toggle',
				name = 'Sleep',
				desc = 'Turn this mod into standby mode.',
				get = function() return self.sleeping end,
				set = function(v) self.sleeping = v self:SleepOrNot() end
			}
		}
	} )

	self:SetDebugging(true)
	
	
end

function CombatLogScribe:SleepOrNot()
	if self.sleeping then
		self:UnregisterAllEvents()
	else
		self:RegisterCombatEvents()
	end
end


function CombatLogScribe:OnEvent()
	if event == "ADDON_LOADED" then
		self:OnInitialize()
	else
		self:OnCombatEvent()
	end
end


function CombatLogScribe:OnCombatEvent()

	local event = _G.event
	local arg1 = _G.arg1
	
	if self.logCombat and ( string.find(event, "SPELL", 1, true) or string.find(event, "COMBAT", 1, true) and not string.find(event, "LOCALPLAYER", 1, true) )then
		if not self.db.combatLog then self.db.combatLog = { e={}, m={} } end
		table.insert(self.db.combatLog.e, event)
		table.insert(self.db.combatLog.m, arg1)
	end
	
	for i, patFormat in pairs(self.patterns.format) do
		local found = string.find(arg1, patFormat)
		if found then
		
			local patName = self.patterns.name[i]
			
			-- Is this an ambiguous pattern which is not converted yet?
			if self.ambiguousPatterns[patName] == NOT_CONVERTED and not self.db.noConvertAmbiguous then
			
				-- Convert it to the global patterns.				
				self:Debug(event,arg1)
				self:ConvertAmbiguousPattern(patName)
			
				-- Update internal pattern formats.
				self.patterns.format[i] = ConvertPattern(patName)
				
				-- Add this pattern to a list of known amgibuous combat log patterns.
				table.insert(self.db.ambiguous, patName)
				
			else
			
				if not self.db.events[event] then self.db.events[event] = {} end
				
				if not self.db.events[event][patName] then
					local pattern = _G[patName]
					self.db.events[event][patName] = { pattern, arg1, self.build }				
					self:Debug("[%s] added to [%s].", patName, event)
				end
				
				
				if self.db.logTrailer then
				
					local count = 0
					for trailName, trailerFormat in pairs(self.trailers) do				
						local found = string.find(arg1, trailerFormat)					
						if found then					
							count = count + 1
							if not self.db.trailers  then self.db.trailers = {} end					
							if not self.db.trailers[patName] then self.db.trailers[patName] = {} end
							
							if not self.db.trailers[patName][trailName] 
								or not self.db.trailers[patName][trailName][3]
								or self.db.trailers[patName][trailName][3] < count then 						
								
								local pattern = _G[trailName]
								self.db.trailers[patName][trailName] = { pattern, arg1, count }
								self:Debug("Trailer [%s] added to [%s].", trailName, patName)
								
							end
						end
					end
				end			
			
			end
			
			return
		end
	end

	self:Debug("[%s] missed: %s", event, arg1)
end


function CombatLogScribe:RegisterCombatEvents()
	for i, event in pairs(self.events) do
		frame:RegisterEvent(event)
	end
end

function CombatLogScribe:LoadPatterns()
	if not self.patterns then self.patterns = {} end
	
	local list = {}

	local TOO_SHORT = self.SHORT_PATTERN_LENGTH
	
	local ignoredCount = 0
	local shortCount = 0
	local totalCount = 0

	local patTable = GetGlobalStringList()
	
	for i,patName in pairs(patTable) do
		local patFormat = _G[patName]
		assert(patFormat, "Pattern of " .. patName .. " is nil.")
		totalCount = totalCount + 1
		if self:IsIgnoredPattern(patName) then
			ignoredCount = ignoredCount + 1
			self.db.ignored[patName] = patFormat
		elseif string.len(patFormat) < TOO_SHORT then
			shortCount = shortCount + 1
			self.db.tooShort[patName] = patFormat
		else
			table.insert(list, patName)
		end
	end
	
	
	-- Now sort the patterns so that the most correct one will be parsed first.
	table.sort(list, 
		function(a,b)
			local pa = _G[a]
			local pb = _G[b]
			local ca=0
			for _ in string.gmatch(pa, "%%%d?%$?[sd]") do ca=ca+1 end
			local cb=0
			for _ in string.gmatch(pb, "%%%d?%$?[sd]") do cb=cb+1 end
			pa = string.gsub(pa, "%%%d?%$?[sd]", "")
			pb = string.gsub(pb, "%%%d?%$?[sd]", "")
			if string.len(pa) == string.len(pb) then
				return  ca < cb;
			else
				return string.len(pa) > string.len(pb)
			end
		end
	)
		
	
	self.patterns.name = list
	
	self:Debug("GlobalStrings: total %d, ignored %d, short %d, saved %d.", totalCount, ignoredCount, shortCount, #list )
	

end

function CombatLogScribe:ConvertPatterns()
	if not self.patterns or not self.patterns.name then
		error("LoadPatterns() should be executed before executing ConvertPatterns().")
	end
	
	local list = {}
	for i, patName in ipairs(self.patterns.name) do
		list[i] = ConvertPattern( _G[patName], true )		
	end
	
	self.patterns.format = list
end

function CombatLogScribe:LoadTrailers()
	if not self.trailers then
		self.trailers = {
			ABSORB_TRAILER = _G.ABSORB_TRAILER,
			BLOCK_TRAILER = _G.BLOCK_TRAILER,
			CRUSHING_TRAILER = _G.CRUSHING_TRAILER,
			GLANCING_TRAILER = _G.GLANCING_TRAILER,
			RESIST_TRAILER = _G.RESIST_TRAILER,
			VULNERABLE_TRAILER = _G.VULNERABLE_TRAILER
		}	
		for i, v in pairs(self.trailers) do
			self.trailers[i] = ConvertPattern(v)
		end
	end
end

function CombatLogScribe:IsIgnoredPattern( patName )
	for i, keyword in ipairs(self.ignoreList) do
		if string.find( patName, keyword ) then
			return true
		end
	end
	return false
end


-- Return ambiguous patterns in the form t[patternName] = true.
function CombatLogScribe:FindAmbiguousPatterns(patternNameList)

	local result = {}	

	local n = #patternNameList
	
	-- search for ambiguous patterns.
	for i=1, n, 1 do
		for j=1, n, 1 do
		
			local name_i = patternNameList[i]
			local name_j = patternNameList[j]
			local format_i = _G[name_i]
			local format_j = _G[name_j]
			if i ~= j and format_i == format_j then							
				result[name_i] = NOT_CONVERTED
				result[name_j] = NOT_CONVERTED
				
			end
			
		end
	end
	
	return result
		
--[[
	-- convert result into a list.
	local list = {}
	for name in pairs(result) do
		table.insert(list, name)
	end
	table.sort(list, function(a,b)
		return _G[a] < _G[b]
	end
	)
	
	return list
]]

end



-- Modify the global pattern to make sure it is not ambiguous.
--   This should be called after getting the ambiguousPatterns.
function CombatLogScribe:ConvertAmbiguousPattern(patternName)
	if not self.ambiguousPatterns[patternName] then
		self:Debug("Trying to convert", patternName, "which does not exist in ambiguousPatterns")
		return
	end
	if self.ambiguousPatterns[patternName] == NOT_CONVERTED then
		_G[patternName] = _G[patternName] .. '[' .. patternName .. ']'
		self.ambiguousPatterns[patternName] = CONVERTED
		self:Debug("Modified ambiguous global pattern", patternName)
	end
end

function CombatLogScribe:ValidateData()
	for event, tEvent in pairs(self.db.events) do
		for pattern, tPattern in pairs(tEvent) do
			if self.ambiguousPatterns[pattern] then
				local record = tPattern[2]
				if not record:find("%[" .. pattern .. "%]$") then
					self:Print(event, pattern, record)
				end
			end
		end
	end
end

-- Return a list of ambiguous records.
function CombatLogScribe:GetAmbiguousRecords()
	local result = {}
	for event in pairs(self.db.events) do
		for pattern in pairs(self.db.events[event]) do
			if self.ambiguousPatterns[pattern] then
				result[pattern] = self.db.events[event][pattern]
			end
		end
	end
	return result
end



