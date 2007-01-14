local tablet = AceLibrary("Tablet-2.0")
local dewdrop = AceLibrary("Dewdrop-2.0")

FuBar_KombatStats = AceLibrary("AceAddon-2.0"):new("FuBarPlugin-2.0", "AceEvent-2.0")

function FuBar_KombatStats:OnEnable()
	for i, event in ipairs(KombatStats.events) do
		self:RegisterEvent(event, "Update")
	end
end

FuBar_KombatStats.ToggleOption = KombatStats.ToggleOption
FuBar_KombatStats.OnMenuRequest = KombatStats.MenuSettings
FuBar_KombatStats.OnTextUpdate = KombatStats.UpdateText	
FuBar_KombatStats.OnTooltipUpdate = KombatStats.UpdateTooltip

function FuBar_KombatStats:OnClick()
	KombatStats:ToggleFrame(KombatStatsFrame);
end

