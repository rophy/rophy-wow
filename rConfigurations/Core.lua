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

function addon:Register(name, order, depAddon, enableFunc, disableFunc)
	local config = {
		name = name,
		order = order or DEFAULT_ORDER,
		dependent = depAddon,
		enable = enableFunc,
		disable = disableFunc
	}
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
		frame:SetScript("OnUpdate", nil)
		OnInitialize()
	end
end

-- When this function is called, all related addons should have already been initialized.
function OnInitialize()
	table.sort(registry, function(a,b) return a.order < b.order end)
	
	for i, config in ipairs(registry) do
		if not config.dependent or IsAddOnLoaded(config.dependent) then
			if config.enable() then
				config.enabled = true
			end
		end
	end
	
end



OnLoad()