
local addonID = "KombatMeters"
local Data = DongleStub("Dongle-1.0"):New(addonID)
local parser = ParserLib:GetInstance("1.1")

local dataIndexes = {}
local data
local skillData
local settings

-- Local Function Declarations --
local OnCombatEvent
local ParseName
local CombatEventHandlers = {}
local AddValue
local AddSkill
local SortData

function Data:Enable()
	settings = self:InitializeDB("KombatMetersData", {
		profile = {
			showType = "DamageDone",
			onlyRaid = true,
			mergePet = false,
		}
	} )
	
	self.db = settings
	
	if not KombatMetersDataPerChar then
		KombatMetersDataPerChar = {
			data = {},
			skill = {}
		}
	end
	data = KombatMetersDataPerChar.data
	self.data = data
	skillData = KombatMetersDataPerChar.skill
	self.skillData = skillData
	
	
	self.cmd = self:InitializeSlashCommand("KombatMeters Slash Command", "KOMBATMETERS", "kombatmeters", "km")
	self.cmd:InjectDBCommands(settings, "copy", "delete", "list", "reset", "set")
	self.cmd:RegisterSlashHandler("clear - Resets all data.", "clear", "ClearData")
	self.cmd:RegisterSlashHandler("mergepet - Toggles merge pet data with owner.", "merge", "ToggleMergePet")
	self.cmd:RegisterSlashHandler("onlyraid - Toggles only show raid members.", "raid", "ToggleOnlyRaid")
	
	self:RegisterEvent("PLAYER_REGEN_DISABLED")
	self:RegisterEvent("PLAYER_REGEN_ENABLED")
	parser:RegisterInfoType(addonID, "hit", OnCombatEvent)
	parser:RegisterInfoType(addonID, "heal", OnCombatEvent)
	parser:RegisterInfoType(addonID, "dispel", OnCombatEvent)
	
	
end

function Data:ToggleMergePet()
	settings.profile.mergePet = not settings.profile.mergePet
	self:Print("mergePet is now set to ", settings.profile.mergePet)

end

function Data:ToggleOnlyRaid()
	settings.profile.onlyRaid = not settings.profile.onlyRaid
	self:Print("onlyRaid is now set to ", settings.profile.onlyRaid)
end

function Data:ClearData()
	for k in pairs(data) do
		data[k] = nil
	end
	for k in pairs(dataIndexes) do
		dataIndexes[k] = nil
	end
	for k in pairs(skillData) do
		skillData[k] = nil
	end
	self:TriggerMessage("KombatMeters_Data_Cleared")
	self:Print("All data cleared.")
end

function Data:PLAYER_REGEN_DISABLED()

end

function Data:PLAYER_REGEN_ENABLED()

end

-- Get a sorted indexes of the data for ordered iteration.
function Data:GetSortedDataIndexes(valueType)
	SortData(valueType)
	return dataIndexes[valueType]
end

-- Get a read-only version of the data, use this with Data:GetSortedDataIndexes(valueType).
function Data:GetDataTable(valueType)
	if not valueType then
		return data
	else
		return data[valueType] or {}
	end
end

function Data:GetSkillData(valueType, name)
	return skillData[valueType] and skillData[valueType][name]
end

-- Iterate data unordered.
function Data:IterateData(valueType)
	return next, data[valueType] or {}
end

function Data:GetShownValueType()
	return settings.profile.showType
end

function Data:SetShownValueType(valueType)
	settings.profile.showType = valueType
	Data:TriggerMessage("KombatMeters_ShownValueType_Changed", valueType)
end


--[[
	1. Change ParserLib_SELF to player name.
	2. if settings.profile.mergePet is true, change pet name to owner name.
]]
function ParseName(name)
	local isPet, unitid = nil
	if name == ParserLib_SELF then
		name = UnitName("player")
	end
	unitid = RaidUnits:GetUnitID(name)
	if unitid and settings.profile.mergePet then
		if unitid == "pet" then
			name = UnitName("player")
			isPet = true
		elseif unitid:find("pet$") then
			name = UnitName(unitid:sub(1,-4))
			isPet = true
		end
	end
	return name, unitid, isPet
end

function OnCombatEvent(infoType, info, event)
	-- Do some common processing first, then dispatch to each handler.
	local source, victim, sourceUnitid, victimUnitid, sourceIsPet, victimIsPet
	
	if info.source and info.source ~= ParserLib_NONE then
		source, sourceUnitid, sourceIsPet = ParseName(info.source)
		if settings.profile.onlyRaid and not sourceUnitid then
			source = nil
		end
	end
	
	if info.victim and info.victim ~= ParserLib_NONE then
		victim, victimUnitid, victimIsPet = ParseName(info.victim)
		if settings.profile.onlyRaid and not victimUnitid then
			victim = nil
		end
	end
	
	CombatEventHandlers[infoType](event, info, source, victim, sourceIsPet, victimIsPet, sourceUnitid, victimUnitid)
end

CombatEventHandlers["hit"] = function(event, info, source, victim, sourceIsPet, victimIsPet, sourceUnitid, victimUnitid)
	if info.amount then
		local skill = info.skill
		if source then
			-- Ignore "split damage" on friendly units.
			if info.isSplit and RaidUnits:GetUnitID(source) then
				return
			end
			AddValue("DamageDone", source, info.amount)
			if skill == ParserLib_MELEE then
				skill = "[Melee]"
			elseif skill == ParserLib_DAMAGESHIELD then
				skill = "[Damage Shield]"
			end
			if sourceIsPet and settings.profile.mergePet then
				skill = string.format("(%s)%s",UnitName(sourceUnitId),tostring(skill))
			end
			AddSkill("DamageDone", source, skill, info.amount)
		end
		if victim then
			AddValue("DamageTaken", victim, info.amount)
		end
	end
end

CombatEventHandlers["heal"] = function(event, info, source, victim, sourceIsPet, victimIsPet, sourceUnitid, victimUnitid)
	if info.amount then
		local overHeal = 0
		local skill = info.skill
		if source then
			if sourceIsPet and settings.profile.mergePet then
				skill = string.format("(%s)%s",UnitName(sourceUnitId),tostring(skill))
			end
			if victimUnitid then
				local healthMissing = UnitHealthMax(victimUnitid) - UnitHealth(victimUnitid)
				overHeal = info.amount - healthMissing
				if overHeal > 0 then
					AddValue("OverHealDone", source, overHeal)
					AddSkill("OverHealDone", source, skill, overHeal)
				end
				AddValue("HealDone", source, info.amount - overHeal)
				AddSkill("HealDone", source, skill, info.amount - overHeal)
			else
				AddValue("HealDone", source, info.amount)
				AddSkill("HealDone", source, skill, info.amount)
			end
		end
		if victim then
			if overHeal > 0 then
				AddValue("HealTaken", victim, info.amount - overHeal)
				AddValue("OverHealTaken", victim, overHeal)
			else
				AddValue("HealTaken", victim, info.amount)
			end
		end
	end
end

CombatEventHandlers["dispel"] = function(event, info, source, victim, sourceIsPet, victimIsPet, sourceUnitid, victimUnitid)
	if not info.isFailed then
		if source then
			local skill = info.skill
			AddValue("Cleansing", source, 1)
			if sourceIsPet and settings.profile.mergePet then
				skill = string.format("(%s)%s",UnitName(sourceUnitId),tostring(skill))
			end
			AddSkill("Cleansing", source, skill, 1)
		end
	end
end


function SortData(valueType)
	if not dataIndexes[valueType] then
		dataIndexes[valueType] = {
			["dirty"] = true
		}
	end
	local dataIndex = dataIndexes[valueType]
	if not dataIndex.dirty then
		return
	end
	for k in pairs(dataIndex) do
		dataIndex[k] = nil
	end
	local valueData = data[valueType]
	if not valueData then
		return
	end
	for name in pairs(valueData) do
		table.insert(dataIndex,name)
	end
	table.sort(dataIndex, function(a,b)
		return valueData[a] > valueData[b]
	end )
	dataIndex.dirty = false
end

function AddValue(valueType, name, amount)
	if not data[valueType] then
		data[valueType] = {}
	end
	if not data[valueType][name] then
		data[valueType][name] = 0
	end
	data[valueType][name] = data[valueType][name] + amount

	if not dataIndexes[valueType] then
		dataIndexes[valueType] = {}
	end
	dataIndexes[valueType].dirty = true

	Data:TriggerMessage("KombatMeters_Data_Updated", valueType, name, data[valueType][name])
end

function AddSkill(valueType, name, skill, amount)
	if not skillData[valueType] then
		skillData[valueType] = {}
	end
	if not skillData[valueType][name] then
		skillData[valueType][name] = {}
	end
	if not skillData[valueType][name][skill] then
		skillData[valueType][name][skill] = 0
	end
	skillData[valueType][name][skill] = skillData[valueType][name][skill] + amount
end

KombatMeters = Data


