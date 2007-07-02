local rDynRep = {}
_G["rDynRep"] = rDynRep

-- Configurations
rDynRep.ignoreDecrease = true

function rDynRep:OnRepEvent(infoType, info, event)
	if info.faction then
		if self.ignoreDecrease and info.isNegative then return end
		local infoFaction, currFaction = info.faction, GetWatchedFactionInfo()
		if infoFaction ~= currFaction then
			for i=1, GetNumFactions() do
				if GetFactionInfo(i) == faction and not IsFactionInactive(i) then
					SetWatchedFactionIndex(i)
				end
			end
		end
	end
end

ParserLib:GetInstance("1.1"):RegisterInfoType(self, "reputation", "OnRepEvent")

