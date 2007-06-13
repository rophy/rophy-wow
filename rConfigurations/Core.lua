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
local initializations = {}
local configurations = {}
local indexes = {}
local DELAY_TIME = 2

function OnLoad()
	frame = CreateFrame("Frame")
	frame:SetScript("OnEvent", OnEvent)
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
end

function OnEvent(frame, event)
	frame:UnregisterAllEvents()
	if rConfigurationsData then
		if rConfigurationsData.initScripts then
			for k, data in pairs(rConfigurationsData.initScripts) do
				initializations[k] = {}
				for m, v in pairs(data) do
					if m == "func" then
						v = loadstring(v)
					end
					initializations[k][m] = v
				end
			end
		end
		if rConfigurationsData.confScripts then
			for k, data in pairs(rConfigurationsData.confScripts) do
				configurations[k] = {}
				for m, v in pairs(data) do
					if m == "func" then
						v = loadstring(v)
					end
					configurations[k][m] = v
				end
			end
		end
	end
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
	for k in pairs(indexes) do
		indexes[k] = nil
	end
	for k,t in pairs(initializations) do
		table.insert(indexes, k)
	end
	table.sort(indexes, function(a,b) 
		return (initializations[a].order or 1000) < (initializations[b].order or 1000)
	end )
	for i, index in ipairs(indexes) do
		if initializations[index].func then
			initializations[index].func()
		end
	end
	initializations = nil
	rConfigure()
end

function rConfigure()
	for k in pairs(indexes) do
		indexes[k] = nil
	end
	for k,t in pairs(configurations) do
		table.insert(indexes, k)
	end
	table.sort(indexes, function(a,b) 
		return (configurations[a].order or 1000) < (configurations[b].order or 1000)
	end )
	for i, index in ipairs(indexes) do
		if configurations[index].func then
			configurations[index].func()
		end
	end
end


configurations["AutoRack"] = {
	order = 90,
	addon = "AutoRack",
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
	addon = "AutoBar",
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
	addon = "ItemRack",
	func = function()
		if ItemRack_InvFrame then
			ItemRack_InvFrame:SetFrameStrata("HIGH")
			ItemRack_InvFrame:ClearAllPoints()
			ItemRack_InvFrame:SetPoint("BOTTOMRIGHT", MainMenuBar, "BOTTOMRIGHT", 2, -7)
		end
	end
}

configurations["Epeen"] = {
	addon = "Epeen",
	func = function()
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
	end,
}


initializations["MenuBar"] = {
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
	addon = "AutoBar",
	func = function()
		if AutoBarFrame then
			AutoBar.LayoutUpdate = configurations.AutoBar.func
		end
	end
}


OnLoad()