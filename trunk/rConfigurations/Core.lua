local OnInitialize
local OnEvent
local OnUpdate
local frame
local timer
local DELAY_TIME = 2
local DEFAULT_ORDER = 1000

local addon = {}
_G["rConfiguration"] = addon

local registry = {}

function addon:Register(config)
	if not config.order then
		config.order = DEFAULT_ORDER
	end
	table.insert(registry, config)
end



function addon:GetRegistry()
	return registry
end


function OnLoad()
	frame = CreateFrame("Frame")
	frame:SetScript("OnEvent", OnEvent)
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
end

function OnEvent(frame, event)
	frame:UnregisterAllEvents()
	frame:SetScript("OnUpdate", OnUpdate)
	frame:Show()
end

function OnUpdate(frame, elapsed)
	if not timer then
		timer = elapsed
	else
		timer = timer + elapsed
	end
	if timer > DELAY_TIME then
		frame:Hide()
		timer = nil
		frame:SetScript("OnUpdate", nil)
		OnInitialize()
	end
end

-- When this function is called, all related addons should have already been initialized.
function OnInitialize()
	if InCombatLockdown() then
		frame:RegisterEvent("PLAYER_REGEN_ENABLED")
	else
		table.sort(registry, function(a,b) return a.order < b.order end)
		
		for i, config in ipairs(registry) do
			if ( not config.dependent or IsAddOnLoaded(config.dependent) ) and config.enable and not config.passive then
				if config.enable() then
					config.enabled = true
				end
			end
		end
	end
end



OnLoad()