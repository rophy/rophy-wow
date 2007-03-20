local OnInitialize
local OnEvent
local OnUpdate
local frame
local timer
local initializations = {}
local configurations = {}
local DELAY_TIME = 2

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
	
	local indexes = {}
	for addon in pairs(initializations) do
		table.insert(indexes, addon)
	end
	
	table.sort(indexes, function(a,b)
		if not a.order then
			return false
		elseif not b.order then
			return true
		else
			return a.order < b.order
		end
	end )
	
	for i, addon in ipairs(indexes) do
		local init = initializations[addon].func
		init()
	end
	initializations = nil
	
	rConfigure()
	
	



end

function rConfigure()

	local indexes = {}
	for addon in pairs(configurations) do
		table.insert(indexes, addon)
	end
	
	table.sort(indexes, function(a,b)
		if not a.order then
			return false
		elseif not b.order then
			return true
		else
			return a.order < b.order
		end
	end )
	
	for i, addon in ipairs(indexes) do
		local config = configurations[addon].func
		config()
	end

end

initializations["MenuBar"] = {
	order = 50,
	func = function()
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
	end
}

initializations["AutoBar"] = {
	order = 100,
	func = function()
		if AutoBarFrame then
			hooksecurefunc(AutoBar, "LayoutUpdate", configurations.AutoBar.func )
		end
	end
}

configurations["AutoRack"] = {
	order = 90,
	func = function()
		if AutoRackSlots then
			AutoRackSlots:ClearAllPoints()
			AutoRackSlots:SetFrameStrata("HIGH")
			AutoRackSlots:SetClampedToScreen(false)
			AutoRackSlots:SetPoint("BOTTOMLEFT",  CharacterMicroButton, "BOTTOMLEFT", -12, -8)
			AutoRackSlots:SetFrameLevel(CharacterMicroButton:GetFrameLevel()+2)
		end
	end
}

configurations["AutoBar"] = {
	order = 100,
	func = function()
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
}

configurations["ItemRack"] = {
	func = function()
		if ItemRack_InvFrame then
			ItemRack_InvFrame:SetFrameStrata("HIGH")
			ItemRack_InvFrame:ClearAllPoints()
			ItemRack_InvFrame:SetPoint("BOTTOMRIGHT", MainMenuBar, "BOTTOMRIGHT", 2, -7)
		end
	end
}


OnLoad()