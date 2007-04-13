--[[
	Maintain a table of the raid names.

]]

local addonName = "KombatMeters_RaidUnits"

RaidUnits = DongleStub("Dongle-1.0"):New(addonName)

local units = {}

function RaidUnits:Enable()
	self:RegisterEvent("RAID_ROSTER_UPDATE", "Refresh")
	self:RegisterEvent("PARTY_MEMBERS_CHANGED", "Refresh")
	self:RegisterEvent("UNIT_PET", "Refresh")
end

function RaidUnits:Refresh()
	for k in pairs(units) do
		units[k] = nil
	end
	local raidSize = GetNumRaidMembers()
	for i=1, raidSize do
		local name = UnitName("raid"..i)
		if name then
			units[name] = "raid"..i
		end
		name = UnitName("raid"..i.."pet")
		if name then
			units[name] = "raid"..i.."pet"
		end
	end
	local partySize = GetNumPartyMembers()
	for i=1, partySize do
		local name = UnitName("party"..i)
		if name then
			units[name] = "party"..i
		end
		name = UnitName("party"..i.."pet")
		if name then
			units[name] = "party"..i.."pet"
		end
	end
	name = UnitName("player")
	units[name] = "player"
	name = UnitName("pet")
	if name then
		units[name] = "pet"
	end
end

function RaidUnits:GetUnitID(name)
	if name == UnitName("player") then
		return "player"
	else
		return units[name]
	end
end
