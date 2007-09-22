local core = rConfiguration


core:Register({
	name = "AutoRack",
	ordedr = 90,
	dependent = "AutoRack",
	enable = function()
		if AutoRackSlots then
			AutoRackSlots:ClearAllPoints()
			AutoRackSlots:SetFrameStrata("HIGH")
			AutoRackSlots:SetClampedToScreen(false)
			AutoRackSlots:SetPoint("BOTTOMLEFT",  CharacterMicroButton, "BOTTOMLEFT", -12, -8)
			AutoRackSlots:SetFrameLevel(CharacterMicroButton:GetFrameLevel()+2)
			return true
		end
	end,
	disable = function()
		if AutoRackSlots then	
			AutoRackSlots:ClearAllPoints()
			AutoRackSlots:SetPoint("CENTER", UIParent, "CENTER")
			return true
		end
	end
} )

core:Register( {
	name = "ItemRack", 
	order = 95,
	dependent = "ItemRack",
	enable = function()
		if ItemRack_InvFrame then
			ItemRack_InvFrame:SetFrameStrata("HIGH")
			ItemRack_InvFrame:ClearAllPoints()
			ItemRack_InvFrame:SetPoint("BOTTOMRIGHT", MainMenuBar, "BOTTOMRIGHT", 2, -7)
			return true
		end
	end
} )

core:Register( {
	name = "Epeen",
	order = nil,
	depedent = "Epeen",
	enable = function()
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
	end 
} )

core:Register( {
	name = "MainMenuBar",
	order = nil,
	dependent = nil,
	enable = function() -- Enable.
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
	disable = function() -- Disable
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
} )


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

core:Register( {
	name = "AutoBar",
	order = 100,
	depdendent = "AutoBar",
	enable = ReadjustAutoBar
} )

local oldLayoutUpdate
core:Register( {
	name = "AutoBar - Hook",
	order = 200,
	dependent = "AutoBar",
	enable = function()
		if AutoBarFrame then
			if not oldLayoutUpdate then
				oldLayoutUpdate = AutoBar.LayoutUpdate
			end
			if AutoBar.LayoutUpdate == oldLayoutUpdate then
				AutoBar.LayoutUpdate = function(...)
					oldLayoutUpdate(...)
					ReadjustAutoBar()
				end
				return true
			end
		end
	end,
	disable = function()
		if AutoBarFrame then
			if oldLayoutUpdate and AutoBar.LayoutUpdate ~= oldLayoutUpdate then
				AutoBar.LayoutUpdate = oldLayoutUpdate
				return true
			end
		end
	end
} )


core:Register( {
	name = "PVP Setup",
	order = nil,
	passive = true,
	dependent = nil,
	enable = function()
		if GetActionText(22) == "Totem" then
			PickupAction(6)
			PickupAction(22)
			PickupAction(6)
			PickupAction(67)
			PickupAction(24)
			PickupAction(67)
			PickupAction(36)
			PickupAction(50)
			PickupAction(36)
		end
		if GetActionText(6) == "Totem" then
			return true
		end
	end,
	disable = function()
		if GetActionText(6) == "Totem" then
			PickupAction(6)
			PickupAction(22)
			PickupAction(6)
			PickupAction(67)
			PickupAction(24)
			PickupAction(67)
			PickupAction(36)
			PickupAction(50)
			PickupAction(36)
		end
		if GetActionText(22) == "Totem" then
			return true
		end
	end,
} )
