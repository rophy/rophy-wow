local tablet = AceLibrary("Tablet-2.0")
local dewdrop = AceLibrary("Dewdrop-2.0")

local version = 1.3

function TitanPanelKombatStatsButton_OnLoad()
	this.registry = { 
		id = "KombatStats",
		menuText = "Titan KombatStats",
		buttonTextFunction = "TitanPanelKombatStatsButton_GetButtonText", 
		frequency = 1.0, 
		--tooltipTitle = TITAN_KOMBATSTATS_TOOLTIP_TITLE,
		--tooltipTextFunction = "TitanPanelKombatStatsButton_GetTooltipText";
		version = version,
		category = "Combat",
	};

	tablet:Register(this,
		'children', function() KombatStats:UpdateTooltip() end,
		'point', function(parent) return "TOPLEFT", "BOTTOMLEFT" end
	);

	dewdrop:Register(this,
		'children', function(level, value) KombatStats:MenuSettings(level, value) end,
		'point', function(parent) return "TOPLEFT", "BOTTOMLEFT" end,
		'dontHook', true	
	);
		
end

function TitanPanelKombatStatsButton_GetButtonText()
	return KombatStats:GetText();
end


function TitanPanelKombatStatsButton_OnClick(arg1)
	if arg1 == "LeftButton" then
		KombatStats:ToggleFrame(KombatStatsFrame);
	elseif arg1 == "RightButton" then
		dewdrop:Open(TitanPanelKombatStatsButton);
	end
end
