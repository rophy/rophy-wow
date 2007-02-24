local frame
local statusBar
local valueText

local GetTime = GetTime
local UnitMana = UnitMana

local textFormat = "%.1f"
local prevEnergy = 0
local duration = 2
local nextTick = 0


local function OnUpdate()

	local currEnergy = UnitMana("player")
	local timer = GetTime()
	local remain
	
	
	if currEnergy > prevEnergy or timer >= nextTick then
		remain = duration
		prevEnergy = currEnergy
		nextTick = timer + duration
	else
		if prevEnergy ~= currEnergy then
			prevEnergy = currEnergy
		end
		remain = nextTick - timer
	end
	
	statusBar:SetValue(duration-remain)
	valueText:SetText(textFormat:format(remain))
	
end

function rEnergyWatch_OnLoad()
	frame = EnergyWatchBar
	statusBar = EnergyWatchFrameStatusBar
	valueText = EnergyWatchText
	
	statusBar:SetMinMaxValues(0, 2)
	frame:SetScript("OnUpdate", OnUpdate)
end
