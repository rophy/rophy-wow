local rDynRep = {}
_G["rDynRep"] = rDynRep

-- Configuration
rDynRep.ignoreDecrease = true

function rDynRep:Enable()
	ParserLib:GetInstance("1.1"):RegisterInfoType(rDynRep, "reputation", "OnRepEvent")
end

function rDynRep:Disable()
	ParserLib:GetInstance("1.1"):UnregisterAllInfoTypes(rDynRep)
end

function rDynRep:OnRepEvent(infoType, info, event)
	if info.faction then
		if self.ignoreDecrease and info.isNegative then return end
		local infoFaction, currFaction = info.faction, GetWatchedFactionInfo()
		if infoFaction ~= currFaction then
			for i=1, GetNumFactions() do
				if GetFactionInfo(i) == infoFaction and not IsFactionInactive(i) then
					SetWatchedFactionIndex(i)
					break
				end
			end
		end
	end
end

rDynRep:Enable()