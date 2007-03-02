local OnEvent
local OnUpdate
local frame
local timer
local DELAY_TIME = 2
function OnLoad()
	frame = CreateFrame("Frame")
	frame:SetScript("OnEvent", OnEvent)
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
end

function OnEvent(frame, event)
	frame:UnregisterAllEvents()
	
	if AutoRackSlots and AutoBarFrame then
		frame:SetScript("OnUpdate", OnUpdate)
		frame:Show()
	end
end

function OnUpdate(frame, elapsed)
	if not timer then
		timer = elapsed
	else
		timer = timer + elapsed
	end
	if timer > DELAY_TIME then
		rConfigure()
	end
end

function rConfigure()
	MainMenuBar:SetToplevel(false)
	AutoRackSlots:ClearAllPoints()
	AutoRackSlots:SetClampedToScreen(false)
	AutoRackSlots:SetPoint("BOTTOMLEFT",  CharacterMicroButton, "BOTTOMLEFT", -12, -8)
	AutoRackSlots:SetFrameLevel(CharacterMicroButton:GetFrameLevel()+2)
	AutoBarFrame:ClearAllPoints()
	AutoBarFrame:SetClampedToScreen(false)
	AutoBarFrame:SetPoint("TOPLEFT",  AutoRackSlots, "TOPLEFT", 162, -43)	
	AutoBarFrame:SetFrameLevel(AutoRackSlots:GetFrameLevel())
	-- CharacterMicroButton:Hide()
	SpellbookMicroButton:Hide()
	TalentMicroButton:Hide()
	QuestLogMicroButton:Hide()
	SocialsMicroButton:Hide()
	LFGMicroButton:Hide()
	MainMenuMicroButton:Hide()
	HelpMicroButton:Hide()
	frame:Hide()
end

OnLoad()