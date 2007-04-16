local tablet = AceLibrary("Tablet-2.0")

local frame = CreateFrame("Frame")

local Display = KombatMeters:NewModule("KombatMeters_Display")

function Display:Enable()
	tablet:Register(frame,
		'children', function() Display:OnTooltipUpdate() end
	)

	tablet:Detach(frame)
	
	
	self:RegisterMessage("KombatMeters_Data_Updated", "Refresh")
	self:RegisterMessage("KombatMeters_Data_Cleared", "Refresh")
	
	self:Refresh()

end

function Display:OnTooltipUpdate()
	tablet:SetTitle("KombatMeters")
	local showType = KombatMeters:GetShownValueType()
	local cat = tablet:AddCategory(
		'text', showType or "None",
		'columns', 2
	)
	if showType then
		local index = KombatMeters:GetSortedDataIndexes(showType)
		local data = KombatMeters:GetDataTable(showType)
		for i, name in ipairs(index) do
			local value = data[name]
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

KSDisplay = Display
