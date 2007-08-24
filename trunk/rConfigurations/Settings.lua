local core = rConfiguration


core:Register("AutoRack", 90, "AutoRack", 
	function() -- Enable
		if AutoRackSlots then
			AutoRackSlots:ClearAllPoints()
			AutoRackSlots:SetFrameStrata("HIGH")
			AutoRackSlots:SetClampedToScreen(false)
			AutoRackSlots:SetPoint("BOTTOMLEFT",  CharacterMicroButton, "BOTTOMLEFT", -12, -8)
			AutoRackSlots:SetFrameLevel(CharacterMicroButton:GetFrameLevel()+2)
			return true
		end
	end,
	function() -- Disable
		AutoRackSlots:SetPoint("CENTER", UIParent, "CENTER")
		return true
	end
)

core:Register("ItemRack", 95, "ItemRack", function()
	if ItemRack_InvFrame then
		ItemRack_InvFrame:SetFrameStrata("HIGH")
		ItemRack_InvFrame:ClearAllPoints()
		ItemRack_InvFrame:SetPoint("BOTTOMRIGHT", MainMenuBar, "BOTTOMRIGHT", 2, -7)
		return true
	end
end )

core:Register("Epeen", nil, "Epeen", function()
	if EpeenTarget_KoSButton then 
		EpeenTarget_KoSButton:ClearAllPoints()
		EpeenTarget_FriendlyButton:ClearAllPoints()
		EpeenTarget_KoSFriendlyFrame:ClearAllPoints()
		EpeenTarget_KoSButton:SetPoint("TOPLEFT", "TargetFrame", "TOPLEFT")
		EpeenTarget_FriendlyButton:SetPoint("TOPLEFT", EpeenTarget_KoSButton, "TOPRIGHT")
		EpeenTarget_KoSFriendlyFrame:SetPoint("BOTTOMRIGHT", "TargetFrame", "TOPRIGHT", -55, -20)
		return true
	end
	if EpeenWarnWindowFrame then
		EpeenWarnWindowFrame:ClearAllPoints()
		EpeenWarnWindowFrame:SetPoint("BOTTOMLEFT", nil, "BOTTOMLEFT", 1,1)
		return true
	end
end )

core:Register("MainMenuBar", nil, nil, 
	function() -- Enable.
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
		return true
	end,
	function() -- Disable
		MainMenuBarLeftEndCap:Show()
		MainMenuBarRightEndCap:Show()
		MainMenuBar:SetToplevel(true)
		SpellbookMicroButton:Show()
		TalentMicroButton:Show()
		QuestLogMicroButton:Show()
		SocialsMicroButton:Show()
		LFGMicroButton:Show()
		MainMenuMicroButton:Show()
		HelpMicroButton:Show()
		CharacterBag3Slot:Show()
		CharacterBag2Slot:Show()
		CharacterBag1Slot:Show()
		CharacterBag0Slot:Show()
		MainMenuBarBackpackButton:Show()
		return true
	end
)


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
		return true
	end
end

core:Register("AutoBar", 100, "AutoBar",  ReadjustAutoBar)

core:Register(nil, 200, "AutoBar", function()
	if AutoBarFrame then
		local oldLayoutUpdate = AutoBar.LayoutUpdate
		AutoBar.LayoutUpdate = function(...)
			oldLayoutUpdate(...)
			ReadjustAutoBar()
		end
		return true
	end
end )
