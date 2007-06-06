local VERSION = "$Revision$"


local statusBar
local valueText

local UnitMana = UnitMana

local textFormat = "%.1f"
local duration = 2

local remain = duration
local prevEnergy = 0

local function OnUpdate(frame, elapsed)
	remain = remain - elapsed
	local currEnergy = UnitMana("player")
	if currEnergy > prevEnergy or remain < 0 then
		remain = duration
		prevEnergy = currEnergy
	end
	prevEnergy = currEnergy
	statusBar:SetValue(duration-remain)
	valueText:SetText(textFormat:format(remain))
end

-- StatusBar.
statusBar = CreateFrame("StatusBar", "rEnergyWatchStatusBar", nil)
statusBar:SetMovable(true)
statusBar:EnableMouse(true)
statusBar:SetScript("OnMouseDown", function(this, arg1)
	if( arg1 == "RightButton" and IsAltKeyDown() ) then
		this:StartMoving();
	end
end )
statusBar:SetScript("OnMouseUp", function(this, arg1)
	if( arg1 == "RightButton" ) then
		this:StopMovingOrSizing();
	end
end )
statusBar:SetMinMaxValues(0, duration)
statusBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
statusBar:SetStatusBarColor(1, 1, 0)
statusBar:SetWidth(90)
statusBar:SetHeight(8)
statusBar:SetPoint("CENTER")
-- Timer FontString.
valueText = statusBar:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
valueText:SetWidth(30)
valueText:SetHeight(8)
valueText:SetPoint("TOPLEFT", statusBar, "TOPRIGHT", 2, 0)
-- Border Texture.
local texture = statusBar:CreateTexture(nil, "OVERLAY")
texture:SetWidth(120)
texture:SetHeight(30)
texture:SetPoint("CENTER")
texture:SetTexture("Interface\\CastingBar\\UI-CastingBar-Border")
statusBar:SetScript("OnUpdate", OnUpdate)
