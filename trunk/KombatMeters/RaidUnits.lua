--[[---------------------------------------------------------------------------
	
	RaidUnits : A tiny library which maps names to unitids.
	
	Author: Rophy
	
	API:
		
		unitid = RaidUnits:GetUnitID("name") 
			- Get unitid from name, nil if the name is not raid member.
		
		unitid = RaidUnits("name") 
			- Shortcut for RaidUnits:GetUnitID("name").
		
		RaidUnits:Refresh() 
			- Manual refresh unitid table, you shouldn't need to call this.
		
-----------------------------------------------------------------------------]]

local version = tonumber(string.match("$Revision$", "(%d+)") or 1)

local RaidUnits

local frame
local units
local timeToRefresh

if _G.RaidUnits then
	local oldLib = _G.RaidUnits
	if oldLib.version >= version then
		-- There is already a newer version.
		return
	else
		-- Upgrading, use the old table so that old references still works.
		frame = oldLib.frame
		for k in pairs(oldLib) do oldLib[k] = nil end
		RaidUnits = oldLib
	end
else
	RaidUnits = {}
end


function OnLoad()
	-- Make RaidUnits("name") as a short cut for RaidUnits:GetUnitID("name").
	setmetatable(RaidUnits, { 
		__call = function(t,k)
			return t:GetUnitID(k)
		end 
	} )
	
	units = {}
	if not frame then
		frame = CreateFrame("Frame")
	end
	frame:Hide()
	frame:SetScript("OnEvent", OnEvent)
	frame:SetScript("OnUpdate", OnUpdate)
	frame:UnregisterAllEvents()
	frame:RegisterEvent("RAID_ROSTER_UPDATE")
	frame:RegisterEvent("PARTY_MEMBERS_CHANGED")
	frame:RegisterEvent("UNIT_PET")
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	RaidUnits.units = units
	RaidUnits.frame = frame
	_G["RaidUnits"] = RaidUnits
end

function OnEvent(frame,event)
	timeToRefresh = 0
	frame:Show()
end

function OnUpdate(this,elapsed)
	timeToRefresh = timeToRefresh + elapsed
	if timeToRefresh > 0.2 then
		RaidUnits:Refresh()
		this:Hide()
		timeToRefresh = 0
	end
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
	return units[name]
end

OnLoad()
