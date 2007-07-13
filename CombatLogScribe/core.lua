-- Variable List.
local SHORT_PATTERN_LENGTH = 7
local CombatLogScribe = {}
local frame
local db
local debugging = true
local wowversion
local patterns = {}
local patternList = {}
local trailerList = {
	"ABSORB_TRAILER",
	"BLOCK_TRAILER",
	"CRUSHING_TRAILER",
	"GLANCING_TRAILER",
	"RESIST_TRAILER",
	"VULNERABLE_TRAILER",
}
local ambiguous
local eventList = {
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
local ignoreList = {
	"ABILITY",
	"ABILITYBOOK_BUTTON",
	"ADDMEMBER",
	"ADDON_CORRUPT",
	"ADD_RAID_MEMBER",
	"AVAILABLE",
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
	"HONOR_STANDING",
  "^INVTYPE",
	"^ITEM_",
	"INSPECT",
	"^KEY",
  "^MELEE",
	"^NEWBIE_TOOLTIP",
	"^OPTION_TOOLTIP",
	"^PVP",
	"REPUTATION",
	"^RESISTANCE",
	"RESILIENCE",
	"^SLASH",
  "^SPELL_CAST",
  "SPELL_CRIT_CHANCE",
  "^SPELL_FAILED",
	"^SPELL_SCHOOL(%d)",
	"SPELL_SKILL_LINE",
	"SPELL_TARGET_TEMPLATE",
	"SPELL_STAT(%d)_NAME",
	"STANDING",
	"^TITLE_TEMPLATE",
	"^TUTORIAL",
	"UNITNAME_TITLE_CHARM",
	"UNKNOWNOBJECT",
	"UNKNOWN",
	"^VOICEMACRO",
	"VULNERABLE_TRAILER",
};


-- Function List.
local ConvertAmbiguousPattern
local ConvertPattern
local Debug
local FindAmbiguousPatterns
local IsIgnoredPattern
local LoadPatterns
local OnCombatEvent
local OnInitialize
local OnLoad
local PatternCompare


function OnLoad()

	local v, b, d = GetBuildInfo()
	wowversion = v .. "." .. b
	
	frame = CreateFrame("Frame")
	frame:SetScript("OnEvent", OnInitialize)
	frame:RegisterEvent("VARIABLES_LOADED")
end

function OnInitialize()
	if not CombatLogScribeDB then 
		CombatLogScribeDB = {}
	end

	db = CombatLogScribeDB
	
	if not db.ambiguous then
		db.ambiguous = {}
	end
	
	
	if not db.events then
		db.events = {}
	end
	
	-- Load patternList.
	LoadPatterns()
	
	-- Load ambiguous from patternList.
	ambiguous = FindAmbiguousPatterns(patternList)
	
	debugging = false
	for i, name in ipairs(db.ambiguous) do
		ConvertAmbiguousPattern(name)
	end
	debugging = true
	
	table.sort(patternList, PatternCompare)
	
	
	-- Convert patterns AFTER converting the ambiguous list.
	for i, name in ipairs(patternList) do
		if _G[name] then
			patterns[name] = ConvertPattern( _G[name], true )
		end
	end
	
	for i, name in ipairs(trailerList) do
		if _G[name] then
			patterns[name] = ConvertPattern( _G[name] )
		end
	end
	
	-- nil out GetGlobalStringList() for gc.
	_G["GetGlobalStringList"] = nil
	
	frame:UnregisterAllEvents()
	frame:SetScript("OnEvent", OnCombatEvent)
	for i, event in ipairs(eventList) do
		frame:RegisterEvent(event)
	end
	
end

function OnCombatEvent(frame, event, arg1)
	for i, name in ipairs(patternList) do
		local pattern = patterns[name]
		local found, pos = arg1:find(pattern)
		if found then
			if ambiguous[pattern] == false then
				ConvertAmbiguousPattern(name)
				patterns[name] = ConvertPattern(_G[name], true)
				table.insert(db.ambiguous, name)
				table.sort(patternList, PatternCompare)
			else
				if not db.events[event] then
					db.events[event] = {}
				end
				
				if not db.events[event][name] then
					local gstr = _G[name]
					db.events[event][name] = { gstr, arg1, wowversion }
					Debug("[%s] added to [%s].", name, event)
				end
				
				local count = 0
				for j, trailer in ipairs(trailerList) do
					local trailerPatttern = patterns[trailer]
					if arg1:find(trailerPatttern, pos) then
						count = count + 1
						if not db.trailers then
							db.trailers = {}
						end
						if not db.trailers[name] then
							db.trailers[name] = {}
						end
						if not db.trailers[name][trailer] 
						or not db.trailers[name][trailer][3]
						or db.trailers[name][trailer][3] < count then
							
							local trailerFmt = _G[trailer]
							db.trailers[name][trailer] = { trailerFmt, arg1, count }
							Debug("Trailer [%s] added to [%s].", trailer, name)
							
						end
					end
				end
			
			end
			
			return
		end
	end
	Debug("[%s] missed:[%s]", event, arg1)
end

-- Debug log function from AceDebug-2.0
local tmp = {}
function Debug(a1, ...)
	if not debugging then
		return
	end

	local output = "|cff7fff7fCombatLogScribe:|r"
	a1 = tostring(a1)
	if a1:find("%%") and select('#', ...) >= 1 then
		for i = 1, select('#', ...) do
			tmp[i] = tostring((select(i, ...)))
		end
		output = output .. " " .. a1:format(unpack(tmp))
		for i = 1, select('#', ...) do
			tmp[i] = nil
		end
	else
		-- This block dynamically rebuilds the tmp array stopping on the first nil.
		tmp[1] = output
		tmp[2] = a1
		for i = 1, select('#', ...) do
			tmp[i+2] = tostring((select(i, ...)))
		end
		
		output = table.concat(tmp, " ")
		
		for i = 1, select('#', ...) + 2 do
			tmp[i] = nil
		end
	end

	DEFAULT_CHAT_FRAME:AddMessage(output)
end

function IsIgnoredPattern(name)
	for i, keyword in ipairs(ignoreList) do
		if string.find( name, keyword ) then
			return true
		end
	end
	return false
end

function LoadPatterns()
	local ignoredCount = 0
	local shortCount = 0
	local totalCount = 0
	local patTable = GetGlobalStringList()
	for k in pairs(patternList) do
		patternList[k] = nil
	end
	db.tooShort = {}
	db.ignored = {}
	for i, name in ipairs(patTable) do
		local pattern = _G[name]
		if pattern then
			totalCount = totalCount + 1
			if IsIgnoredPattern(name) then
				ignoredCount = ignoredCount + 1
				db.ignored[name] = pattern
			elseif string.len(pattern) < SHORT_PATTERN_LENGTH then
				shortCount = shortCount + 1
				db.tooShort[name] = pattern
			else
				table.insert(patternList, name)
			end
		end
	end
	
	
	Debug("GlobalStrings: total %d, ignored %d, short %d, saved %d.", totalCount, ignoredCount, shortCount, #patternList )
end

function PatternCompare(a, b)
	local pa = _G[a]
	local pb = _G[b]
	
	if pa and not pb then
		return true
	elseif pb and not pa then
		return false
	elseif not pa and not pb then
		return a < b
	else
		local ca=0
		for _ in pa:gmatch("%%%d?%$?[sd]") do ca=ca+1 end
		local cb=0
		for _ in pb:gmatch("%%%d?%$?[sd]") do cb=cb+1 end

		pa = pa:gsub("%%%d?%$?[sd]", "")
		pb = pb:gsub("%%%d?%$?[sd]", "")

		if pa:len() == pb:len() then
			return ca < cb
		else
			return pa:len() > pb:len()
		end
	end
	
end

function ConvertAmbiguousPattern(name)
	if ambiguous[name] == nil then
		Debug("Trying to convert", name, "which does not exist in ambiguousPatterns")
	elseif ambiguous[name] == false then
		_G[name] = _G[name] .. '[' .. name .. ']'
		ambiguous[name] = true
		Debug("Modified ambiguous global pattern " .. name)
	end
end

function FindAmbiguousPatterns(patternList)
	local result = {}

	local n = #patternList
	
	-- search for ambiguous patterns.
	for i=1, n, 1 do
		for j=1, n, 1 do
		
			local name_i = patternList[i]
			local name_j = patternList[j]
			local format_i = _G[name_i]
			local format_j = _G[name_j]
			if i ~= j and format_i == format_j then							
				result[name_i] = false
				result[name_j] = false
			end
			
		end
	end
	return result
end

function ConvertPattern(pattern, anchor)

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


OnLoad()

