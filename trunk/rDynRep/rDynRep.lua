local parser = ParserLib:GetInstance("1.1")

local rDynRep = {}
_G["rDynRep"] = rDynRep

-- Configurations
rDynRep.ignoreDecrease = true

function rDynRep.OnRepEvent(event, info)
	if info.type == "reputation" and info.faction then
		if rDynRep.ignoreDecrease and info.isNegative then return end
		local faction = info.faction
		local oldName = GetWatchedFactionInfo()
		if faction ~= oldName then
			for i=1, GetNumFactions() do
				local name = GetFactionInfo(i)
				if name == faction and not IsFactionInactive(i) then
					SetWatchedFactionIndex(i)
				end
			end
		end
	end
end

parser:RegisterEvent(CHAT_MSG_COMBAT_FACTION_CHANGE, rDynRep.OnRepEvent)

