--[[
	rConfigurationsData = {
		initScripts = {
			[50] = {	-- Order of execution.
				addon = "ItemRack",
				script = "ChatFrame1:AddMessage('Hello! World!')",
			},
		},
		confScripts = {
		}
	}



]]


local OnInitialize
local OnEvent
local OnUpdate
local frame
local timer
local DELAY_TIME = 2

local addon = {}
_G["rConfiguration"] = addon

local registry = {}

function addon:Register(order, depAddon, enableFunc, disableFunc)
	local config = {
		order = order,
		dependent = depAddon,
		enable = enableFunc,
		disable = disableFunc
	}
	table.insert(registry, config)
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
	table.sort(registry, function(a,b)
		if not a.order then
			return false
		elseif not b.order then
			return true
		else
			return a.order < b.order
		end
	end)
	
	for i, config in ipairs(registry) do
		if not config.dependent or IsAddOnLoaded(config.dependent) then
			config.enable()
		end
	end
	
end


addon:Register(90, "AutoRack", function()
	if AutoRackSlots then
		AutoRackSlots:ClearAllPoints()
		AutoRackSlots:SetFrameStrata("HIGH")
		AutoRackSlots:SetClampedToScreen(false)
		AutoRackSlots:SetPoint("BOTTOMLEFT",  CharacterMicroButton, "BOTTOMLEFT", -12, -8)
		AutoRackSlots:SetFrameLevel(CharacterMicroButton:GetFrameLevel()+2)
	end
end)

addon:Register(95, "ItemRack", function()
	if ItemRack_InvFrame then
		ItemRack_InvFrame:SetFrameStrata("HIGH")
		ItemRack_InvFrame:ClearAllPoints()
		ItemRack_InvFrame:SetPoint("BOTTOMRIGHT", MainMenuBar, "BOTTOMRIGHT", 2, -7)
	end
end )

addon:Register(nil, "Epeen", function()
	if EpeenTarget_KoSButton then 
		EpeenTarget_KoSButton:ClearAllPoints()
		EpeenTarget_FriendlyButton:ClearAllPoints()
		EpeenTarget_KoSFriendlyFrame:ClearAllPoints()
		EpeenTarget_KoSButton:SetPoint("TOPLEFT", "TargetFrame", "TOPLEFT")
		EpeenTarget_FriendlyButton:SetPoint("TOPLEFT", EpeenTarget_KoSButton, "TOPRIGHT")
		EpeenTarget_KoSFriendlyFrame:SetPoint("BOTTOMRIGHT", "TargetFrame", "TOPRIGHT", -55, -20)
	end
	if EpeenWarnWindowFrame then
		EpeenWarnWindowFrame:ClearAllPoints()
		EpeenWarnWindowFrame:SetPoint("BOTTOMLEFT", nil, "BOTTOMLEFT", 1,1)
	end
end )

addon:Register(nil, nil, function()
	MainMenuBarLeftEndCap:Hide()
	MainMenuBarRightEndCap:Hide()
	MainMenuBar:SetToplevel(false)
	SpellbookMicroButton:Hide()
	TalentMicroButton:Hide()
	QuestLogMicroButton:Hide()
	SocialsMicroButton:Hide()
	LFGMicroButton:Hide()
	MainMenuMicroButton:Hide()
	HelpMicroButton:Hide()
	CharacterBag3Slot:Hide()
	CharacterBag2Slot:Hide()
	CharacterBag1Slot:Hide()
	CharacterBag0Slot:Hide()
	MainMenuBarBackpackButton:Hide()
end )


local ReadjustAutoBar = function()
	if AutoBarFrame then
		AutoBarFrame:ClearAllPoints()
		AutoBarFrame:SetClampedToScreen(false)
		if AutoRackSlots then
			AutoBarFrame:SetPoint("TOPLEFT",  AutoRackSlots, "TOPLEFT", 162, -43)	
			AutoBarFrame:SetFrameLevel(AutoRackSlots:GetFrameLevel())
		else
			AutoBarFrame:SetPoint("BOTTOMLEFT", CharacterMicroButton, "BOTTOMLEFT", 0, 0)
			AutoBarFrame:SetFrameLevel(CharacterMicroButton:GetFrameLevel()+1)
		end
	end
end

addon:Register(100, "AutoBar",  ReadjustAutoBar)

addon:Register(200, "AutoBar", function()
	if AutoBarFrame then
		local oldLayoutUpdate = AutoBar.LayoutUpdate
		AutoBar.LayoutUpdate = function(...)
			oldLayoutUpdate(...)
			ReadjustAutoBar()
		end
	end
end )


OnLoad()