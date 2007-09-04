-- LibStub is a simple versioning stub meant for use in Libraries.  http://www.wowace.com/wiki/LibStub for more info
-- LibStub is hereby placed in the Public Domain Credits: Kaelten, Cladhaire, ckknight, Mikk, Ammo, Nevcairiel, joshborke
local LIBSTUB_MAJOR, LIBSTUB_MINOR = "LibStub", 2  -- NEVER MAKE THIS AN SVN REVISION! IT NEEDS TO BE USABLE IN ALL REPOS!
local LibStub = _G[LIBSTUB_MAJOR]

if not LibStub or LibStub.minor < LIBSTUB_MINOR then
	LibStub = LibStub or {libs = {}, minors = {} }
	_G[LIBSTUB_MAJOR] = LibStub
	LibStub.minor = LIBSTUB_MINOR
	
	function LibStub:NewLibrary(major, minor)
		assert(type(major) == "string", "Bad argument #2 to `NewLibrary' (string expected)")
		minor = assert(tonumber(strmatch(minor, "%d+")), "Minor version must either be a number or contain a number.")
		
		local oldminor = self.minors[major]
		if oldminor and oldminor >= minor then return nil end
		self.minors[major], self.libs[major] = minor, self.libs[major] or {}
		return self.libs[major], oldminor
	end
	
	function LibStub:GetLibrary(major, silent)
		if not self.libs[major] and not silent then
			error(("Cannot find a library instance of %q."):format(tostring(major)), 2)
		end
		return self.libs[major], self.minors[major]
	end
	
	function LibStub:IterateLibraries() return pairs(self.libs) end
	setmetatable(LibStub, { __call = LibStub.GetLibrary })
end

local LIB_PARSER_MAJOR, LIB_PARSER_MINOR = "LibParser", 1
local LibParser, libParserOldMinor = LibStub:NewLibrary(LIB_PARSER_MAJOR, LIB_PARSER_MINOR)
if LibParser then

	-- Special event for debugging.
	local EVENT_PARSE_FAILED = "_EVENT_PARSE_FAILED"

	---- Local Data ----
	local lib = LibParser
	local eventMap
	local patternInfo
	local keywords
	local clients
	local frame
	local initialized
	
	---- Local Functions ----
	local Activate
	local Initialize
	local OnEvent
	local FindPattern
	local GenerateEventMap
	local GenerateKeywords
	local LoadPatternInfo
	local NotifyClients

	--[[---------------------------------------------------------------------------
	Notes:
		* Registers for an event.
	Arguments:
		assign an unique addonID.
		string - the Blizzard event to register for.
		string or function - the callback function to be called. If type(addonID)=="table" then this will be the method name or method reference of the table object, otherwise this will be the global function name or function reference. The callback function should be in the form Callback(event,message,pattern,...).
	Example:
		local obj = {}
		-- Object method.
		function obj:OnEvent(event,message,pattern,...)
			-- Do something.
		end
		-- Function.
		function OnCombatEvent(event,message,pattern,...)
			-- Do something.
		end
		Parser:RegisterEvent(obj,"CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE","OnEvent")	-- 1
		Parser:RegisterEvent(obj,"CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE",obj.OnEvent)	-- This has the same effect as 1.
		Parser:RegisterEvent("MyAddon","CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE","OnCombatEvent")	-- 2
		Parser:RegisterEvent("MyAddon","CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE",OnCombatEvent)	-- This has the same effect as 2.
	-----------------------------------------------------------------------------]]
	function lib:RegisterEvent(addonID, event, callback)
--		if eventMap[event] and addonID then
		if addonID then
			if type(callback) == "string" then
				if type(addonID) == "table" then
					callback = addonID[callback]
				else
					callback = _G[callback]
				end
			end
			if not callback then
				error('Usage: RegisterEvent(addonID, "event", callback or "callback")')
			end
			if not clients[event] then
				clients[event] = {}
			end
			clients[event][addonID] = callback
			frame:RegisterEvent(event)
		end
	end

	--[[---------------------------------------------------------------------------
	Notes:
		* Checks if you have registered an event.
	Arguments:
		the unique addonID.
		string - the Blizzard event to register for.
	Returns:
		boolean - true if the event has been registered, false otherwise.
	Example:
		if Parser:IsEventRegistered("MyAddon", "CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE") then
			-- Do somethng.
		end
	-----------------------------------------------------------------------------]]
	function lib:IsEventRegistered(addonID, event)
		return ( clients[event] and clients[event][addonID] )
	end

	--[[---------------------------------------------------------------------------
	Notes:
		* Unregisters an event.
	Arguments:
		the unique addonID.
		string - the Blizzard event to register for.
	Example:
		Parser:UnregisterEvent("MyAddon", "CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE")
	-----------------------------------------------------------------------------]]
	function lib:UnregisterEvent(addonID, event)
		if clients[event] and clients[event][addonID] then
			clients[event][addonID] = nil
			if not next(clients[event]) then
				frame:UnregisterEvent(event)
			end
		end
	end

	--[[---------------------------------------------------------------------------
	Notes:
		* Unregisters all events.
	Arguments:
		the unique addonID.
	Example:
		Parser:UnregisterAllEvents("MyAddon")
	-----------------------------------------------------------------------------]]
	function lib:UnregisterAllEvents(addonID)
		for event in pairs(clients) do
			self:UnregisterEvent(addonID, event)
		end
	end

	-- #NODOC
	function lib:GetInternalTables()
		return eventMap,patternInfo,keywords,frame,clients,OnEvent,Initialize
	end


	function GenerateEventMap()
		-- Provide the optimized eventMap of enUS as the default table.
		local locale = "enUS"
		local eventMap = {
			["CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS"] = {
				"SPELLLOGCRITSCHOOLOTHEROTHER",
				"SPELLLOGSCHOOLOTHEROTHER",
				"COMBATHITCRITSCHOOLOTHEROTHER",
				"COMBATHITSCHOOLOTHEROTHER",
				"SPELLLOGCRITOTHEROTHER",
				"SPELLLOGOTHEROTHER",
				"COMBATHITCRITOTHEROTHER",
				"COMBATHITOTHEROTHER",
				"VSENVIRONMENTALDAMAGE_SLIME_OTHER",
				"VSENVIRONMENTALDAMAGE_LAVA_OTHER",
				"VSENVIRONMENTALDAMAGE_FIRE_OTHER",
				"VSENVIRONMENTALDAMAGE_FATIGUE_OTHER",
				"VSENVIRONMENTALDAMAGE_DROWNING_OTHER",
				"VSENVIRONMENTALDAMAGE_FALLING_OTHER",
			},
			["CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES"] = {
				"VSABSORBOTHEROTHER",
				"VSRESISTOTHEROTHER",
				"IMMUNEDAMAGECLASSOTHEROTHER",
				"VSIMMUNEOTHEROTHER",
				"IMMUNEOTHEROTHER",
				"VSDEFLECTOTHEROTHER",
				"VSPARRYOTHEROTHER",
				"VSEVADEOTHEROTHER",
				"VSBLOCKOTHEROTHER",
				"VSDODGEOTHERSELF",
				"VSDODGEOTHEROTHER",
				"MISSEDOTHEROTHER",
			},
			["CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS"] = {
				"SPELLLOGCRITSCHOOLOTHERSELF",
				"SPELLLOGSCHOOLOTHERSELF",
				"COMBATHITCRITSCHOOLOTHERSELF",
				"SPELLLOGCRITSCHOOLOTHEROTHER",
				"COMBATHITSCHOOLOTHERSELF",
				"SPELLLOGSCHOOLOTHEROTHER",
				"COMBATHITCRITSCHOOLOTHEROTHER",
				"COMBATHITSCHOOLOTHEROTHER",
				"SPELLLOGCRITOTHERSELF",
				"SPELLLOGOTHERSELF",
				"COMBATHITCRITOTHERSELF",
				"SPELLLOGCRITOTHEROTHER",
				"COMBATHITOTHERSELF",
				"SPELLLOGOTHEROTHER",
				"COMBATHITCRITOTHEROTHER",
				"COMBATHITOTHEROTHER",
				"VSENVIRONMENTALDAMAGE_SLIME_OTHER",
				"VSENVIRONMENTALDAMAGE_LAVA_OTHER",
				"VSENVIRONMENTALDAMAGE_FIRE_OTHER",
				"VSENVIRONMENTALDAMAGE_FATIGUE_OTHER",
				"VSENVIRONMENTALDAMAGE_DROWNING_OTHER",
				"VSENVIRONMENTALDAMAGE_FALLING_OTHER",
			},
			["CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES"] = {
				"VSABSORBOTHERSELF",
				"VSRESISTOTHERSELF",
				"VSABSORBOTHEROTHER",
				"VSRESISTOTHEROTHER",
				"IMMUNEOTHERSELF",
				"IMMUNEDAMAGECLASSOTHERSELF",
				"VSIMMUNEOTHERSELF",
				"IMMUNEDAMAGECLASSOTHEROTHER",
				"VSIMMUNEOTHEROTHER",
				"IMMUNEOTHEROTHER",
				"VSDEFLECTOTHERSELF",
				"VSPARRYOTHERSELF",
				"VSBLOCKOTHERSELF",
				"VSEVADEOTHERSELF",
				"VSDODGEOTHERSELF",
				"VSDEFLECTOTHEROTHER",
				"VSPARRYOTHEROTHER",
				"VSBLOCKOTHEROTHER",
				"VSEVADEOTHEROTHER",
				"VSDODGEOTHEROTHER",
				"MISSEDOTHERSELF",
				"MISSEDOTHEROTHER",
			},
			["CHAT_MSG_COMBAT_FACTION_CHANGE"] = {
				"FACTION_STANDING_INCREASED",
				"FACTION_STANDING_DECREASED",
				"FACTION_STANDING_CHANGED",
			},
			["CHAT_MSG_COMBAT_FRIENDLY_DEATH"] = {
				"SELFKILLOTHER",
				"UNITDESTROYEDOTHER",
				"PARTYKILLOTHER",
				"UNITDIESSELF",
				"UNITDIESOTHER",
			},
			["CHAT_MSG_COMBAT_HONOR_GAIN"] = {
				"COMBATLOG_HONORGAIN",
				"COMBATLOG_HONORAWARD",
				"COMBATLOG_DISHONORGAIN",
			},
			["CHAT_MSG_COMBAT_SELF_HITS"] = {
				"SPELLLOGCRITSCHOOLSELFOTHER",
				"SPELLLOGSCHOOLSELFOTHER",
				"COMBATHITCRITSCHOOLSELFOTHER",
				"COMBATHITSCHOOLSELFOTHER",
				"SPELLLOGCRITSELFOTHER",
				"SPELLLOGSELFOTHER",
				"COMBATHITCRITSELFOTHER",
				"COMBATHITSELFOTHER",
				"VSENVIRONMENTALDAMAGE_SLIME_SELF",
				"VSENVIRONMENTALDAMAGE_LAVA_SELF",
				"VSENVIRONMENTALDAMAGE_FATIGUE_SELF",
				"VSENVIRONMENTALDAMAGE_FIRE_SELF",
				"VSENVIRONMENTALDAMAGE_DROWNING_SELF",
				"VSENVIRONMENTALDAMAGE_FALLING_SELF",
			},
			["CHAT_MSG_COMBAT_SELF_MISSES"] = {
				"IMMUNESELFSELF",
				"VSABSORBSELFOTHER",
				"VSRESISTSELFOTHER",
				"IMMUNEDAMAGECLASSSELFOTHER",
				"VSIMMUNESELFOTHER",
				"IMMUNESELFOTHER",
				"VSDEFLECTSELFOTHER",
				"VSPARRYSELFOTHER",
				"VSDODGESELFOTHER",
				"VSBLOCKSELFOTHER",
				"VSEVADESELFOTHER",
				"SPELLMISSSELFOTHER",
				"MISSEDSELFOTHER",
			},
			["CHAT_MSG_COMBAT_XP_GAIN"] = {
				"COMBATLOG_XPGAIN_EXHAUSTION4_RAID",
				"COMBATLOG_XPGAIN_EXHAUSTION5_RAID",
				"COMBATLOG_XPGAIN_EXHAUSTION5_GROUP",
				"COMBATLOG_XPGAIN_EXHAUSTION4_GROUP",
				"COMBATLOG_XPGAIN_EXHAUSTION2_RAID",
				"COMBATLOG_XPGAIN_EXHAUSTION1_RAID",
				"COMBATLOG_XPGAIN_EXHAUSTION1_GROUP",
				"COMBATLOG_XPGAIN_EXHAUSTION2_GROUP",
				"COMBATLOG_XPGAIN_FIRSTPERSON_RAID",
				"COMBATLOG_XPGAIN_FIRSTPERSON_GROUP",
				"COMBATLOG_XPGAIN_EXHAUSTION5",
				"COMBATLOG_XPGAIN_EXHAUSTION4",
				"COMBATLOG_XPGAIN_EXHAUSTION1",
				"COMBATLOG_XPGAIN_EXHAUSTION2",
				"COMBATLOG_XPGAIN_FIRSTPERSON_UNNAMED_RAID",
				"COMBATLOG_XPGAIN_FIRSTPERSON_UNNAMED_GROUP",
				"COMBATLOG_XPGAIN_FIRSTPERSON",
				"COMBATLOG_XPLOSS_FIRSTPERSON_UNNAMED",
				"COMBATLOG_XPGAIN_FIRSTPERSON_UNNAMED",
				"COMBATLOG_XPGAIN",
			},
			["CHAT_MSG_SPELL_AURA_GONE_OTHER"] = {
				"AURAREMOVEDOTHER",
			},
			["CHAT_MSG_SPELL_AURA_GONE_SELF"] = {
				"AURAREMOVEDSELF",
				"AURAREMOVEDOTHER",
			},
			["CHAT_MSG_SPELL_BREAK_AURA"] = {
				"AURADISPELSELF3",
				"AURADISPELSELF2",
				"AURADISPELSELF",
				"AURADISPELOTHER3",
				"AURADISPELOTHER2",
				"AURADISPELOTHER",
				"AURASTOLENOTHEROTHER",
				"AURASTOLENOTHERSELF",
				"AURASTOLENSELFOTHER",
				"AURASTOLENSELFSELF",
			},
			["CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF"] = {
				"SPELLPOWERLEECHOTHERSELF",
				"SPELLEXTRAATTACKSOTHER",
				"HEALEDCRITOTHERSELF",
				"SPELLEXTRAATTACKSOTHER_SINGULAR",
				"SPELLPOWERLEECHOTHEROTHER",
				"HEALEDCRITOTHEROTHER",
				"SPELLPOWERDRAINOTHERSELF",
				"HEALEDOTHERSELF",
				"HEALEDCRITSELF",
				"HEALEDCRITOTHER",
				"SPELLPOWERDRAINOTHEROTHER",
				"HEALEDOTHEROTHER",
				"HEALEDOTHER",
				"POWERGAINOTHERSELF",
				"POWERGAINOTHEROTHER",
				"POWERGAINOTHER",
				"SPELLCASTOTHERSTART",
				"SIMPLEPERFORMOTHERSELF",
				"ITEMENCHANTMENTADDOTHERSELF",
				"SIMPLECASTOTHERSELF",
				"SIMPLEPERFORMOTHEROTHER",
				"OPEN_LOCK_OTHER",
				"ITEMENCHANTMENTADDOTHEROTHER",
				"SIMPLECASTOTHEROTHER",
				"SPELLTERSEPERFORM_OTHER",
				"SPELLTERSE_OTHER",
				"SPELLPERFORMOTHERSTART",
				"SPELLIMMUNEOTHERSELF",
				"SPELLREFLECTOTHEROTHER",
				"IMMUNESPELLOTHERSELF",
				"SPELLDEFLECTEDOTHEROTHER",
				"SPELLIMMUNEOTHEROTHER",
				"SPELLIMMUNEOTHER",
				"SPELLRESISTOTHEROTHER",
				"SPELLLOGABSORBOTHEROTHER",
				"SPELLPARRIEDOTHEROTHER",
				"SPELLBLOCKEDOTHEROTHER",
				"SPELLDODGEDOTHEROTHER",
				"SPELLEVADEDOTHEROTHER",
				"SPELLDEFLECTEDOTHERSELF",
				"IMMUNESPELLOTHEROTHER",
				"SPELLRESISTOTHERSELF",
				"SPELLREFLECTOTHERSELF",
				"SPELLBLOCKEDOTHERSELF",
				"SPELLPARRIEDOTHERSELF",
				"SPELLEVADEDOTHERSELF",
				"SPELLDODGEDOTHERSELF",
				"SPELLLOGABSORBOTHERSELF",
				"SPELLMISSOTHERSELF",
				"SPELLMISSOTHEROTHER",
				"PROCRESISTOTHERSELF",
				"PROCRESISTOTHEROTHER",
				"SPELLSPLITDAMAGEOTHERSELF",
				"SPELLSPLITDAMAGEOTHEROTHER",
				"DISPELFAILEDOTHERSELF",
				"DISPELFAILEDOTHEROTHER",
			},
			["CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE"] = {
				"SPELLLOGCRITSCHOOLOTHERSELF",
				"SPELLLOGSCHOOLOTHERSELF",
				"SPELLLOGCRITSCHOOLOTHEROTHER",
				"SPELLLOGSCHOOLOTHEROTHER",
				"SPELLLOGCRITOTHERSELF",
				"SPELLLOGOTHERSELF",
				"SPELLLOGCRITOTHEROTHER",
				"SPELLLOGOTHEROTHER",
				"SPELLCASTOTHERSTART",
				"SPELLPERFORMOTHERSTART",
				"SPELLPOWERLEECHOTHERSELF",
				"SPELLPOWERLEECHOTHEROTHER",
				"SPELLPOWERDRAINOTHERSELF",
				"SPELLPOWERDRAINOTHEROTHER",
				"SPELLPOWERDRAINSELF",
				"SPELLPOWERDRAINOTHER",
				"SPELLIMMUNEOTHERSELF",
				"SPELLREFLECTOTHEROTHER",
				"IMMUNESPELLOTHERSELF",
				"SPELLDEFLECTEDOTHEROTHER",
				"SPELLIMMUNEOTHEROTHER",
				"SPELLRESISTOTHEROTHER",
				"SPELLLOGABSORBOTHEROTHER",
				"SPELLPARRIEDOTHEROTHER",
				"SPELLBLOCKEDOTHEROTHER",
				"SPELLDODGEDOTHEROTHER",
				"SPELLEVADEDOTHEROTHER",
				"SPELLDEFLECTEDOTHERSELF",
				"IMMUNESPELLOTHEROTHER",
				"SPELLRESISTOTHERSELF",
				"SPELLREFLECTOTHERSELF",
				"SPELLBLOCKEDOTHERSELF",
				"SPELLPARRIEDOTHERSELF",
				"SPELLEVADEDOTHERSELF",
				"SPELLDODGEDOTHERSELF",
				"SPELLLOGABSORBOTHERSELF",
				"SPELLMISSOTHERSELF",
				"SPELLMISSOTHEROTHER",
				"INSTAKILLSELF",
				"INSTAKILLOTHER",
				"PROCRESISTOTHERSELF",
				"PROCRESISTOTHEROTHER",
				"SPELLSPLITDAMAGEOTHERSELF",
				"SPELLSPLITDAMAGEOTHEROTHER",
				"SPELLDURABILITYDAMAGEALLOTHERSELF",
				"SPELLDURABILITYDAMAGEALLOTHEROTHER",
				"SPELLDURABILITYDAMAGEOTHERSELF",
				"SPELLDURABILITYDAMAGEOTHEROTHER",
				"SPELLINTERRUPTOTHERSELF",
				"SPELLINTERRUPTOTHEROTHER",
				"SIMPLECASTOTHERSELF",
				"SIMPLECASTOTHEROTHER",
				"SPELLTERSE_OTHER",
				"SIMPLEPERFORMOTHERSELF",
				"OPEN_LOCK_OTHER",
				"SIMPLEPERFORMOTHEROTHER",
				"SPELLTERSEPERFORM_OTHER",
				"SPELLEXTRAATTACKSOTHER",
				"SPELLEXTRAATTACKSOTHER_SINGULAR",
				"DISPELFAILEDOTHERSELF",
				"DISPELFAILEDOTHEROTHER",
				"SPELLLOGCRITSCHOOLSELF",
				"SPELLLOGSCHOOLSELF",
				"SPELLLOGCRITSCHOOLOTHER",
				"SPELLLOGCRITSELF",
				"SPELLLOGSELF",
				"SPELLLOGOTHER",
				"SPELLLOGSCHOOLOTHER",
				"SPELLRESISTOTHER",
				"SPELLRESISTSELF",
				"IMMUNESPELLOTHER",
				"IMMUNESPELLSELF",
				"SPELLIMMUNEOTHER",
				"SPELLIMMUNESELF",
				"SPELLLOGABSORBOTHER",
				"SPELLLOGABSORBSELF",
			},
			["CHAT_MSG_SPELL_DAMAGESHIELDS_ON_OTHERS"] = {
				"DAMAGESHIELDOTHERSELF",
				"DAMAGESHIELDOTHEROTHER",
				"SPELLRESISTOTHEROTHER",
				"SPELLRESISTOTHERSELF",
			},
			["CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF"] = {
				"DAMAGESHIELDSELFOTHER",
				"SPELLRESISTSELFOTHER",
				"DAMAGESHIELDOTHERSELF",
				"DAMAGESHIELDOTHEROTHER",
				"SPELLRESISTOTHEROTHER",
			},
			["CHAT_MSG_SPELL_FAILED_LOCALPLAYER"] = {
				"SPELLFAILPERFORMSELF",
				"SPELLFAILCASTSELF",
			},
			["CHAT_MSG_SPELL_ITEM_ENCHANTMENTS"] = {
				"ITEMENCHANTMENTADDSELFSELF",
				"ITEMENCHANTMENTADDSELFOTHER",
				"ITEMENCHANTMENTADDOTHERSELF",
				"ITEMENCHANTMENTADDOTHEROTHER",
			},
			["CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS"] = {
				"PERIODICAURAHEALSELFOTHER",
				"PERIODICAURAHEALOTHEROTHER",
				"SPELLPOWERLEECHOTHERSELF",
				"SPELLPOWERLEECHOTHEROTHER",
				"SPELLPOWERDRAINOTHERSELF",
				"SPELLPOWERDRAINOTHEROTHER",
				"POWERGAINOTHERSELF",
				"AURAAPPLICATIONADDEDOTHERHELPFUL",
				"POWERGAINOTHEROTHER",
				"AURAADDEDOTHERHELPFUL",
				"PERIODICAURADAMAGESELFOTHER",
				"PERIODICAURADAMAGEOTHEROTHER",
				"PERIODICAURADAMAGEOTHER",
				"AURAAPPLICATIONADDEDOTHERHARMFUL",
				"AURAADDEDOTHERHARMFUL",
			},
			["CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE"] = {
				"AURAAPPLICATIONADDEDOTHERHARMFUL",
				"AURAADDEDOTHERHARMFUL",
				"PERIODICAURADAMAGESELFOTHER",
				"PERIODICAURADAMAGEOTHEROTHER",
				"PERIODICAURADAMAGEOTHER",
				"SPELLLOGABSORBSELFOTHER",
				"SPELLLOGABSORBOTHEROTHER",
				"SPELLPOWERLEECHOTHERSELF",
				"SPELLPOWERLEECHOTHEROTHER",
				"SPELLPOWERDRAINOTHERSELF",
				"SPELLPOWERDRAINOTHEROTHER",
				"POWERGAINOTHERSELF",
				"AURAAPPLICATIONADDEDOTHERHELPFUL",
				"POWERGAINOTHEROTHER",
				"AURAADDEDOTHERHELPFUL",
				"SPELLLOGABSORBOTHER",
			},
			["CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS"] = {
				"PERIODICAURAHEALSELFOTHER",
				"PERIODICAURAHEALOTHERSELF",
				"PERIODICAURAHEALOTHEROTHER",
				"PERIODICAURAHEALSELFSELF",
				"AURAAPPLICATIONADDEDSELFHELPFUL",
				"POWERGAINOTHEROTHER",
				"POWERGAINOTHERSELF",
				"POWERGAINSELFSELF",
				"AURAAPPLICATIONADDEDOTHERHELPFUL",
				"AURAADDEDSELFHELPFUL",
				"POWERGAINSELFOTHER",
				"AURAADDEDOTHERHELPFUL",
				"SPELLPOWERLEECHSELFOTHER",
				"SPELLPOWERDRAINSELFSELF",
				"SPELLPOWERDRAINSELFOTHER",
				"PERIODICAURADAMAGESELFSELF",
				"PERIODICAURADAMAGEOTHERSELF",
				"PERIODICAURADAMAGESELF",
			},
			["CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE"] = {
				"PERIODICAURADAMAGESELFSELF",
				"PERIODICAURADAMAGEOTHERSELF",
				"PERIODICAURADAMAGESELFOTHER",
				"PERIODICAURADAMAGEOTHEROTHER",
				"PERIODICAURADAMAGESELF",
				"PERIODICAURADAMAGEOTHER",
				"AURAAPPLICATIONADDEDSELFHARMFUL",
				"AURAADDEDSELFHARMFUL",
				"AURAAPPLICATIONADDEDOTHERHARMFUL",
				"AURAADDEDOTHERHARMFUL",
				"SPELLLOGABSORBSELFOTHER",
				"SPELLLOGABSORBOTHEROTHER",
				"SPELLLOGABSORBSELFSELF",
				"SPELLLOGABSORBOTHERSELF",
				"SPELLPOWERLEECHSELFOTHER",
				"SPELLPOWERDRAINSELFSELF",
				"SPELLPOWERDRAINSELFOTHER",
				"SPELLLOGABSORBSELF",
				"SPELLLOGABSORBOTHER",
			},
			["CHAT_MSG_SPELL_SELF_BUFF"] = {
				"HEALEDCRITSELFSELF",
				"HEALEDCRITSELFOTHER",
				"HEALEDSELFSELF",
				"HEALEDSELFOTHER",
				"ITEMENCHANTMENTADDSELFSELF",
				"ITEMENCHANTMENTADDSELFOTHER",
				"SIMPLECASTSELFOTHER",
				"SIMPLECASTSELFSELF",
				"SPELLTERSE_SELF",
				"OPEN_LOCK_SELF",
				"SIMPLEPERFORMSELFOTHER",
				"SIMPLEPERFORMSELFSELF",
				"SPELLTERSEPERFORM_SELF",
				"DISPELFAILEDSELFSELF",
				"DISPELFAILEDSELFOTHER",
				"SPELLCASTSELFSTART",
				"SPELLPERFORMSELFSTART",
				"SPELLEXTRAATTACKSSELF",
				"SPELLPOWERLEECHSELFOTHER",
				"SPELLEXTRAATTACKSSELF_SINGULAR",
				"SPELLPOWERDRAINSELFSELF",
				"SPELLPOWERDRAINSELFOTHER",
				"POWERGAINSELFSELF",
				"POWERGAINSELFOTHER",
				"SPELLSPLITDAMAGESELFOTHER",
				"SPELLIMMUNESELFSELF",
				"SPELLREFLECTSELFOTHER",
				"SPELLIMMUNESELFOTHER",
				"IMMUNESPELLSELFSELF",
				"SPELLDEFLECTEDSELFOTHER",
				"SPELLRESISTSELFOTHER",
				"SPELLBLOCKEDSELFOTHER",
				"SPELLLOGABSORBSELFOTHER",
				"SPELLEVADEDSELFOTHER",
				"SPELLPARRIEDSELFOTHER",
				"SPELLDODGEDSELFOTHER",
				"SPELLREFLECTSELFSELF",
				"SPELLDEFLECTEDSELFSELF",
				"IMMUNESPELLSELFOTHER",
				"SPELLRESISTSELFSELF",
				"SPELLPARRIEDSELFSELF",
				"SPELLEVADEDSELFSELF",
				"SPELLLOGABSORBSELFSELF",
				"SPELLDODGEDSELFSELF",
				"PROCRESISTSELFSELF",
				"SPELLMISSSELFSELF",
				"PROCRESISTSELFOTHER",
				"SPELLMISSSELFOTHER",
			},
			["CHAT_MSG_SPELL_SELF_DAMAGE"] = {
				"SPELLLOGCRITSCHOOLSELFSELF",
				"SPELLLOGSCHOOLSELFSELF",
				"SPELLLOGCRITSCHOOLSELFOTHER",
				"SPELLLOGCRITSCHOOLSELF",
				"SPELLLOGCRITSCHOOLOTHER",
				"SPELLLOGSCHOOLSELFOTHER",
				"SPELLLOGCRITSELFSELF",
				"SPELLLOGSELFSELF",
				"SPELLLOGCRITSELFOTHER",
				"SPELLLOGSELFOTHER",
				"SPELLLOGSELF",
				"SPELLDURABILITYDAMAGEALLSELFOTHER",
				"SPELLDURABILITYDAMAGESELFOTHER",
				"SIMPLECASTSELFOTHER",
				"SIMPLECASTSELFSELF",
				"SPELLTERSE_SELF",
				"OPEN_LOCK_SELF",
				"SIMPLEPERFORMSELFOTHER",
				"SIMPLEPERFORMSELFSELF",
				"SPELLTERSEPERFORM_SELF",
				"SPELLIMMUNESELFSELF",
				"SPELLREFLECTSELFOTHER",
				"SPELLIMMUNESELFOTHER",
				"IMMUNESPELLSELFSELF",
				"SPELLDEFLECTEDSELFOTHER",
				"SPELLRESISTSELFOTHER",
				"SPELLLOGABSORBSELFOTHER",
				"SPELLLOGABSORBOTHER",
				"SPELLBLOCKEDSELFOTHER",
				"SPELLPARRIEDSELFOTHER",
				"SPELLDODGEDSELFOTHER",
				"SPELLEVADEDSELFOTHER",
				"SPELLDEFLECTEDSELFSELF",
				"SPELLREFLECTSELFSELF",
				"IMMUNESPELLSELFOTHER",
				"SPELLRESISTSELFSELF",
				"SPELLPARRIEDSELFSELF",
				"SPELLDODGEDSELFSELF",
				"SPELLEVADEDSELFSELF",
				"SPELLLOGABSORBSELFSELF",
				"SPELLLOGABSORBSELF",
				"SPELLMISSSELFSELF",
				"SPELLMISSSELFOTHER",
				"SPELLCASTSELFSTART",
				"SPELLPERFORMSELFSTART",
				"SPELLINTERRUPTSELFOTHER",
				"DISPELFAILEDSELFSELF",
				"DISPELFAILEDSELFOTHER",
				"SPELLEXTRAATTACKSSELF",
				"SPELLEXTRAATTACKSSELF_SINGULAR",
				"SPELLPOWERLEECHSELFOTHER",
				"SPELLPOWERDRAINSELFSELF",
				"SPELLPOWERDRAINSELFOTHER",
				"SPELLLOGSCHOOLSELF",
				"SPELLLOGSCHOOLOTHER",
			},
			["CHAT_MSG_SPELL_TRADESKILLS"] = {
				"FEEDPET_LOG_FIRSTPERSON",
				"FEEDPET_LOG_THIRDPERSON",
				"TRADESKILL_LOG_FIRSTPERSON",
				"TRADESKILL_LOG_THIRDPERSON",
			},
		}
		eventMap['CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS'] = eventMap['CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS']
		eventMap['CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES'] = eventMap['CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES']
		eventMap['CHAT_MSG_COMBAT_FRIENDLYPLAYER_HITS'] = eventMap['CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS']
		eventMap['CHAT_MSG_COMBAT_FRIENDLYPLAYER_MISSES'] = eventMap['CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES']
		eventMap['CHAT_MSG_COMBAT_HOSTILE_DEATH'] = eventMap['CHAT_MSG_COMBAT_FRIENDLY_DEATH']
		eventMap['CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS'] = eventMap['CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS']
		eventMap['CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES'] = eventMap['CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES']
		eventMap['CHAT_MSG_COMBAT_PARTY_HITS'] = eventMap['CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS']
		eventMap['CHAT_MSG_COMBAT_PARTY_MISSES'] = eventMap['CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES']
		eventMap['CHAT_MSG_COMBAT_PET_HITS'] = eventMap['CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS']
		eventMap['CHAT_MSG_COMBAT_PET_MISSES'] = eventMap['CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES']
		eventMap['CHAT_MSG_SPELL_AURA_GONE_PARTY'] = eventMap['CHAT_MSG_SPELL_AURA_GONE_OTHER']
		eventMap['CHAT_MSG_SPELL_CREATURE_VS_PARTY_BUFF'] = eventMap['CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF']
		eventMap['CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE'] = eventMap['CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE']
		eventMap['CHAT_MSG_SPELL_CREATURE_VS_SELF_BUFF'] = eventMap['CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF']
		eventMap['CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE'] = eventMap['CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE']
		eventMap['CHAT_MSG_SPELL_FRIENDLYPLAYER_BUFF'] = eventMap['CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF']
		eventMap['CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE'] = eventMap['CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE']
		eventMap['CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF'] = eventMap['CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF']
		eventMap['CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE'] = eventMap['CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE']
		eventMap['CHAT_MSG_SPELL_PARTY_BUFF'] = eventMap['CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF']
		eventMap['CHAT_MSG_SPELL_PARTY_DAMAGE'] = eventMap['CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE']
		eventMap['CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS'] = eventMap['CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS']
		eventMap['CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE'] = eventMap['CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE']
		eventMap['CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS'] = eventMap['CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS']
		eventMap['CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE'] = eventMap['CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE']
		eventMap['CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS'] = eventMap['CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS']
		eventMap['CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE'] = eventMap['CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE']
		eventMap['CHAT_MSG_SPELL_PET_BUFF'] = eventMap['CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF']
		eventMap['CHAT_MSG_SPELL_PET_DAMAGE'] = eventMap['CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE']
		if GetLocale() == "deDE" then
			-- Remove ITEMENCHANTMENTADDOTHERSELF, it's ambiguous to SIMPLECASTOTHEROTHER.
			-- Remove ITEMENCHANTMENTADDSELFSELF, it's ambiguous to SIMPLECASTSELFOTHER.
			for event, list in pairs(eventMap) do
				for i, pattern in ipairs(list) do
					if pattern == 'ITEMENCHANTMENTADDOTHERSELF' or pattern == 'ITEMENCHANTMENTADDSELFSELF' then
						table.remove(list, i)
					end
				end
			end
		end
		if GetLocale() ~= locale then
			-- Get the list of events.
			local eventList = {}
			for event in pairs(eventMap) do
				table.insert(eventList, event)
			end
			-- Record the lists which have the same reference, noneed to sort them twice.
			local map = {}
			for i, event in ipairs(eventList) do
				if not map[event] then
					local CompareFunc = function(a, b)
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
					table.sort(eventMap[event], CompareFunc)
				end
				for j=i+1, #eventList, 1 do
					local event2 = eventList[j]
					if eventMap[event2] == eventMap[event] then
						map[event2] = true
					end
				end
			end
		end
		-- Adding this because RegisterEvent() checks for the entry in eventMap.
		eventMap[EVENT_PARSE_FAILED] = {}
		return eventMap
	end

	-- Auto-generate the keywords with the idea suggested by ckknight.
	function GenerateKeywords()
		local keywords = {}
		local wordCounts = {}
		local patterns = {}
		-- Get a list of patterns.
		for event, list in pairs(eventMap) do
			for i, pattern in ipairs(list) do
				patterns[pattern] = true
			end
		end
		-- Count how many GlobalString contains the word.
		local function CountWord(word)
			if not wordCounts[word] then
				wordCounts[word] = 0
				for pattern in pairs(patterns) do
					local str = _G[pattern]
					if str and str:find(word, 1, true) then
						wordCounts[word] = wordCounts[word] + 1
					end
				end
			end
		end
		-- Parse for the keywords in each pattern.
		for pattern in pairs(patterns) do
			local str = _G[pattern]
			if str then
				local fpat = "(.-)%%%d?%$?[sd]"
				local last_end = 1
				local s, e, cap = str:find(fpat, 1)
				while s do
					if s ~= 1 or w ~= "" then
						CountWord(cap)
					end
					last_end = e+1
					s, e, cap = str:find(fpat, last_end)
				end
				if last_end <= str:len() then
					cap = str:sub(last_end)
					CountWord(cap)
				end
			end
		end
		-- Parse for the keywords in each pattern again, find the rarest word.
		for pattern in pairs(patterns) do
			local str = _G[pattern]
			local minCount, rarestWord
			if str then
				local fpat = "(.-)%%%d?%$?[sd]"
				local last_end = 1
				local s, e, cap = str:find(fpat, 1)
				while s do
					if s ~= 1 or w ~= "" then
						if not rarestWord or minCount > wordCounts[cap] or ( minCount == wordCounts[cap] and cap:len() < rarestWord:len() ) then
							minCount = wordCounts[cap]
							rarestWord = cap
						end
					end
					last_end = e+1
					s, e, cap = str:find(fpat, last_end)
				end
				if last_end <= str:len() then
					cap = str:sub(last_end)
					if not rarestWord or minCount > wordCounts[cap] or ( minCount == wordCounts[cap] and cap:len() < rarestWord:len() ) then
						minCount = wordCounts[cap]
						rarestWord = cap
					end
				end
				keywords[pattern] = rarestWord
			end
		end
		return keywords
	end

	--[[ Initialization ]]--
	function Activate()
		---- Version Upgrade ----
		if libParserOldMinor and libParserOldMinor < LIB_PARSER_MINOR then
		end
		if not lib.clients then
			lib.clients = {}
		end
		if not lib.frame then
			lib.frame = CreateFrame("Frame")
		end
		lib.frame:SetScript("OnEvent", OnEvent)
		clients = lib.clients
		frame = lib.frame
	end
	
	function Initialize()
		patternInfo = {}
		eventMap = GenerateEventMap()
		keywords = GenerateKeywords()
		initialized = true
	end

	--[[ Section Block for OnEvent() ]]--
	do
		local tokens = {}
		function OnEvent(frame, event, arg1)
			if not initialized then -- initialize lazily.
				Initialize()
			end
			if not eventMap[event] then
				return
			end
			local pos, pattern = FindPattern(arg1, eventMap[event], tokens)
			if pattern then
				NotifyClients(event,arg1,pattern,unpack(tokens))
			else
				NotifyClients(EVENT_PARSE_FAILED,event,arg1)
			end
		end
	end

	function NotifyClients(event, ...)
		local clients = lib.clients
		if clients[event] then
			for addonID, handler in pairs(clients[event]) do
				local success, ret
				if type(addonID) == 'table' then
					success, ret = pcall(handler, addonID, event, ...)
				else
					success, ret = pcall(handler, event, ...)
				end
				if not success then
					geterrorhandler()(ret)
				end
			end
		end
	end

	--[[ Section Block for FindPattern() ]]--
	do
		local function ProcessReturns(t,map,from,to,...)
			if to then
				local count = select('#',...)
				assert( map == nil or count == #map )
				if map then
					for i=1, count do
						t[i] = select(map[i],...)
					end
				else
					for i=1, count do
						t[i] = select(i,...)
					end
				end
				return to
			end
		end

	--[[---------------------------------------------------------------------------
	Notes:
		* Searches through a list of patterns to find the matching one.
		* The function will first do a plain string search against keywords[pattern], so the global table 'keywords' should be properly initialized before calling this function.
		* While searching, necessary information about the patterns will be generated on demand and cached in the global table 'patternInfo'.
	Arguments:
		string - the string to search, e.g. "You hit Somebody for 100."
		array - a list of pattern names to search through.
		array - if a matching pattern is found, an empty table should be provided to store the parsed tokens.
	Returns:
		integer - the last matching position of the message, i.e. the 2nd return from string.find
		string - the matched pattern name
	Example:
		local tokens = {}
		local pos, pattern = FindPattern("You hits Somebody for 100.", { "COMBATHITCRITSELFOTHER", "COMBATHITSELFOTHER" }, tokens)
		assert( pos == 25 )
		assert( pattern == "COMBATHITSELFOTHER" )
		assert( #tokens == 2 )
		assert( tokens[1] == "Somebody" )
		assert( tokens[2] == 100 )
	-----------------------------------------------------------------------------]]
		function FindPattern(message, patternList, tokens)
			for i, pattern in ipairs(patternList) do
				if patternInfo[pattern] == nil then
					LoadPatternInfo(pattern)
				end
				local pi = patternInfo[pattern]
				if pi then
					if not keywords
					or not keywords[pattern]
					or message:find(keywords[pattern], 1, true) then
					
						local pos = ProcessReturns(tokens, pi.map, message:find(pi.p) )
						if pos then
							if pi.nf then
								-- convert the numberic tokens to number.
								if type(pi.nf) == 'number' then
									tokens[pi.nf] = tonumber(tokens[pi.nf])
								elseif type(pi.nf) == 'table' then
									for _, idx in ipairs(pi.nf) do
										tokens[idx] = tonumber(tokens[idx])
									end
								end
							end
							return pos, pattern
						end
					end
				else
					error("Failed to load pattern " .. pattern)
				end
			end
		end
	end

	--[[ Section Block for LoadPatternInfo() ]]--
	do
		local tmp = {}
		local tmp2 = {}
		-- Convert "%s hits %s for %d." to "(.+) hits (.+) for (%d+)."
		-- Will additionaly return the sequence of tokens, for example:
		--  "%2$s reflects %3$d %4$s damage to %1$s." will return:
		--    "(.-) reflects (%+) (.-) damage to (.-)%.", 4 1 2 3.
		--  (    [1]=2,[2]=3,[3]=4,[4]=1  Reverting indexes and become  [1]=4, [2]=[1],[3]=2,[4]=3. )
		local function ConvertPattern(pattern, anchor)
			local seq -- fills with ordered list of $s as they appear
			-- Add % to escape all magic characters used in LUA pattern matching, except $ and %
			pattern = pattern:gsub("([%^%(%)%.%[%]%*%+%-%?])","%%%1")
			if pattern:find("%$") then
				seq = tmp
				for k in pairs(seq) do
					seq[k] = nil
				end
				local idx = 1 -- incremental index into field[]
				local prevIdx = idx
				local tmpSeq = tmp2
				for k in pairs(tmpSeq) do
					tmpSeq[k] = nil
				end
				for i in pattern:gmatch("%%(%d?)%$?[sd]") do
					if tonumber(i) then
						tmpSeq[idx] = tonumber(i)
						prevIdx = tonumber(i)+1
					else
						tmpSeq[idx] = prevIdx
						prevIdx = idx + 1
					end
					idx = idx + 1
				end
				for i, j in ipairs(tmpSeq) do
					seq[j] = i
				end
			end
			
			-- Do these AFTER escaping the magic characters.
			pattern = pattern:gsub("%%%d?%$?s", "(.-)")
			pattern = pattern:gsub("%%%d?%$?d", "(%-?%%d+)")
			
			-- Escape $ now.
			pattern = pattern:gsub("%$","%%$")

			-- Anchor tag can improve string.find() performance by 100%.
			if anchor then pattern = "^"..pattern end

			-- If the pattern ends with (.-), replace it with (.+), or the capsule will be lost.
			if pattern:sub(-4) == "(.-)" then
				pattern = pattern:sub(0, -5) .. "(.+)"
			end

			if seq then
				return pattern, unpack(seq)
			else
				return pattern
			end
		end
		local function ProcessReturns(...)
			local pattern,map
			local count = select('#',...)
			pattern = select(1,...)
			if count > 1 then
				map = { select(2,...) }
			end
			return pattern, map
		end
		function LoadPatternInfo(patternName)
			if patternInfo[patternName] == nil then
				
				local info = {}
				patternInfo[patternName] = info
				
				local fmt = _G[patternName]
				if not fmt then
					patternInfo[patternName] = false
					return false
				end
				
				info.p, info.map = ProcessReturns(ConvertPattern(fmt,true))
				-- Record index of %d tokens in the field info.nf
				-- To save space, info.nf is a index number if the pattern has only one %d, and is a table only when there are more than one %d.
				local i = 0
				local nf
				string.gsub(fmt, "%%(%d?)%$?([sd])", function(index,capsule)
					if index then
						i = tonumber(index)
					else
						i=i+1
					end
					if capsule == 'd' then
						if not nf then
							nf = i
						elseif type(nf) == 'number' then
							nf = { nf }
							table.insert(nf, i)
						else
							table.insert(nf, i)
						end
					end
				end )
				info.nf = nf
			end
			return patternInfo[patternName]
		end
	end
	Activate()
end


