local tablet = AceLibrary("Tablet-2.0")

local frame = CreateFrame("Frame")

local Display = KombatMeters:NewModule("KombatMeters_Display")

function Display:Enable()
	tablet:Register(frame,
		'children', function() Display:OnTooltipUpdate() end
	)

	tablet:Detach(frame)

end

function Display:OnTooltipUpdate()
	local cat = tablet:AddCategory(
		'columns', 2
	)
	local showType = KombatMeters.db.profile.showType
	if showType and KombatMeters.data[showType] then
		for name, value in pairs(KombatMeters.data[showType]) do
			cat:AddLine(
				'text', name,
				'text2', value
			)
		end
	end
end

function Display:Refresh()
	tablet:Refresh(frame)
end


KombatMeters.display = Display