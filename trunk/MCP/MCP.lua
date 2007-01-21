-- 
-- MCP - Master Control Program
--
-- Allows you to control AddOn loading after logging in.
-- 
--  Marc aka Saien on Hyjal
--  WOWSaien@gmail.com
--  http://64.168.251.69/wow
--
-- Changes
--   2006.06.19
--     Additional features by Rophy : check changes.txt for detail.
--   2006.01.02
--     1.9 release
--     In game changes to the addon list are limited to changing the currently 
--       logged in character only. You cannot change Addons for other characters. 
--       This is a Blizzard restriction.
--   2005.10.10
--     1.8 release

MCP_NO_NOTES = "No information available."

ADDON_LOADED = "Loaded";
ADDON_WILL_NOT_LOAD = "Will not load";
ADDON_REFUSE_TO_LOAD = "Disabled in MCP";
UIPanelWindows["MCP_AddonList"] = { area = "center", pushable = 0, whileDead = 1 };
StaticPopupDialogs["MCP_RELOADUI"] = {
	text = "Reload your User Interface?",
	button1 = TEXT(ACCEPT),
	button2 = TEXT(CANCEL),
	OnAccept = function()
		ReloadUI();
	end,
	timeout = 0,
	hideOnEscape = 1
};
MCP_VERSION = "2006.12.16";
MCP_LINEHEIGHT = 16;
MCP_SET_SIZE = 10
local MCP_MAXADDONS = 20;
local MCP_MyClass
local MCP_EditBox
local MCP_BLIZZARD_ADDONS = { 
	"Blizzard_AuctionUI",
	"Blizzard_BattlefieldMinimap",
	"Blizzard_BindingUI",
	"Blizzard_CraftUI",
	"Blizzard_InspectUI",
	"Blizzard_MacroUI",
	"Blizzard_RaidUI",
	"Blizzard_TalentUI",
	"Blizzard_TradeSkillUI",
	"Blizzard_TrainerUI",
};
local MCP_BLIZZARD_ADDONS_TITLES = { 
	"Blizzard: Auction",
	"Blizzard: Battlefield Minimap",
	"Blizzard: Binding",
	"Blizzard: Craft",
	"Blizzard: Inspect",
	"Blizzard: Macro",
	"Blizzard: Raid",
	"Blizzard: Talent",
	"Blizzard: Trade Skill",
	"Blizzard: Trainer",
};
local MCP_old_LoadAddOn = nil;

-- local MCP_old_IsOptionFrameOpen = nil;
-- local function MCP_new_IsOptionFrameOpen()
-- 	if (MCP_AddonList:IsVisible()) then
-- 		return 1;
-- 		return MCP_old_IsOptionFrameOpen();
-- 	end
-- 	else
-- end

--[[ This taints Blizzard UI.
local function MCP_new_LoadAddOn(name)
	if (not IsAddOnLoaded(name) and MCP_Config and MCP_Config.refusetoload and MCP_Config.refusetoload[name]) then
--		MCP_Print( string.format("blocked loading of %s", name), 1, 0, 0 )
		return 1
		-- return nil, "REFUSE_TO_LOAD";
	else
		return MCP_old_LoadAddOn(name);
	end
end
]]

function MCP_SlashCommand(msg)

end

function MCP_OnLoad()
	
	-- MCP_old_LoadAddOn = LoadAddOn;
	-- LoadAddOn = MCP_new_LoadAddOn;
	
	this:RegisterEvent("VARIABLES_LOADED")
	
	SLASH_MCP1 = "/mcp"
	SlashCmdList["MCP"] = MCP_SlashCommand(msg)
	
	
	_, MCP_MyClass = UnitClass("player")
	
end


function MCP_OnEvent(event)

	if event == "VARIABLES_LOADED" then
	
		MCP_DefaultSet = {}
		
		for i = 1, GetNumAddOns() do
			if IsAddOnLoaded(i) then
				local name = GetAddOnInfo(i)
				table.insert(MCP_DefaultSet, name)
			end
		end
		
		this:UnregisterEvent("VARIABLES_LOADED")
		
	end
	
end

function MCP_AddonList_Enable(index,enabled)
	if (type(index) == "number") then
		if (enabled) then
			EnableAddOn(index);
		else
			DisableAddOn(index);
		end
	end
	MCP_AddonList_OnShow();
end

function MCP_AddonList_LoadNow(index)
	UIParentLoadAddOn(index);
	MCP_AddonList_OnShow();
end

function MCP_AddonList_OnShow()
	local function setSecurity (obj, idx)
		local width,height,iconWidth = 64,16,16;
		local increment = iconWidth/width;
		local left = (idx-1)*increment;
		local right = idx*increment;
		obj:SetTexCoord(left, right, 0, 1);
	end


	local numAddons = GetNumAddOns();
	local origNumAddons = numAddons;
	numAddons = numAddons + table.getn(MCP_BLIZZARD_ADDONS);
	FauxScrollFrame_Update(MCP_AddonList_ScrollFrame, numAddons, MCP_MAXADDONS, MCP_LINEHEIGHT, nil, nil, nil);
	local i;
	local offset = FauxScrollFrame_GetOffset(MCP_AddonList_ScrollFrame);
	for i = 1, MCP_MAXADDONS, 1 do
		obj = getglobal("MCP_AddonListEntry"..i);
		local addonIdx = offset+i;
		if (addonIdx > numAddons) then
			obj:Hide();
			obj.addon = nil;
		else
			obj:Show();
			local titleText = getglobal("MCP_AddonListEntry"..i.."Title");
			local status = getglobal("MCP_AddonListEntry"..i.."Status");
			local checkbox = getglobal("MCP_AddonListEntry"..i.."Enabled");
			local securityIcon = getglobal("MCP_AddonListEntry"..i.."SecurityIcon");
			local loadnow = getglobal("MCP_AddonListEntry"..i.."LoadNow");

			local name, title, notes, enabled, loadable, reason, security;
			if (addonIdx > origNumAddons) then
				name = MCP_BLIZZARD_ADDONS[(addonIdx-origNumAddons)];
				obj.addon = name;
				title = MCP_BLIZZARD_ADDONS_TITLES[(addonIdx-origNumAddons)];
				notes = "";
				enabled = 1;
				loadable = 1;
				if (IsAddOnLoaded(name)) then
					reason = "LOADED";
					loadable = 1;
				end
				security = "SECURE";
			else
				name, title, notes, enabled, loadable, reason, security = GetAddOnInfo(addonIdx);
				obj.addon = addonIdx;
			end
			local loaded = IsAddOnLoaded(name);
			local ondemand = IsAddOnLoadOnDemand(name);
			if (loadable) then
				titleText:SetTextColor(1,0.78,0);
			elseif (enabled and reason ~= "DEP_DISABLED") then
				titleText:SetTextColor(1,0.1,0.1);
			else
				titleText:SetTextColor(0.5,0.5,0.5);
			end
			if (title) then
				titleText:SetText(title);
			else
				titleText:SetText(name);
			end
			if (name == "MCP" or addonIdx > origNumAddons) then
				checkbox:Hide();
			else
				checkbox:Show();
				checkbox:SetChecked(enabled);
			end
			if (security == "SECURE") then
				setSecurity(securityIcon,1);
			elseif (security == "INSECURE") then
				setSecurity(securityIcon,2);
			elseif (security == "BANNED") then -- wtf?
				setSecurity(securityIcon,3);
			end
			if (reason) then
				status:SetText(TEXT(getglobal("ADDON_"..reason)));
			elseif (loaded) then
				status:SetText(TEXT(ADDON_LOADED));
			elseif (ondemand) then
				status:SetText("Loaded on demand.");
			else
				status:SetText("");
			end
			if (not loaded and enabled and ondemand) then
				loadnow:Show();
			else
				loadnow:Hide();
			end
		end

	end
end


 function MCP_SetDropDown_OnShow()
	local info, count
	for i = 1, 	MCP_SET_SIZE do	
		local name = nil
		
		if MCP_Config and MCP_Config.AddonSet and MCP_Config.AddonSet[i] then
			count = table.getn(MCP_Config.AddonSet[i])
			name = MCP_Config.AddonSet[i].name
		else
			count = 0
		end
		
		if not name then name = "Set " .. i end
		
		info = { 
			text = string.format("%s (%d)", name , count),
			func = MCP_SetDropDown_OnClick,
			value = i
		}
		
		UIDropDownMenu_AddButton(info)
	end	
	
	if MCP_Config and MCP_Config.AddonSet and MCP_Config.AddonSet[MCP_MyClass] then
		count = table.getn(MCP_Config.AddonSet[MCP_MyClass])
	else
		count = 0
	end
	
	info = { 
		text = string.format("%s (%d)", UnitClass("player"), count),
		func = MCP_SetDropDown_OnClick,
		value = MCP_MyClass
	}
	UIDropDownMenu_AddButton(info)
	
	info = { 
		text = string.format("Default (%d)", table.getn(MCP_DefaultSet)),
		func = MCP_SetDropDown_OnClick ,
		value = 0
	}
	UIDropDownMenu_AddButton(info)
	
end

function MCP_SetDropDown_OnClick()
	UIDropDownMenu_SetSelectedValue( MCPAddonSetDropDown, this.value )
end

function MCP_SaveSet_OnClick()
	local value = 	UIDropDownMenu_GetSelectedValue(MCPAddonSetDropDown)	

	if value and value ~= 0 then
		local setName
		
		if not MCP_Config then MCP_Config = {} end
		if not MCP_Config.AddonSet then MCP_Config.AddonSet = {} end
		
		if MCP_Config.AddonSet[value] then 
			setName = MCP_Config.AddonSet[value].name
		end
			
		MCP_Config.AddonSet[value] = { name=setName }
		local name, enabled
		for i = 1, GetNumAddOns() do
			name, _, _, enabled = GetAddOnInfo(i)
			if enabled and name ~= "MCP" then
				table.insert(MCP_Config.AddonSet[value], name)
			end
		end
		MCP_Print(string.format("Saved on set %s.",value))
	end
	
end

function MCP_UnloadSet_OnClick()
	local value = UIDropDownMenu_GetSelectedValue(MCPAddonSetDropDown)
	if not value then return end

	local list

	if value == 0 then
		list = MCP_DefaultSet
	else
		if not MCP_Config or not MCP_Config.AddonSet or not MCP_Config.AddonSet[value] then return end
		list = MCP_Config.AddonSet[value]
	end

	local name
	for i = 1, GetNumAddOns() do
		name = GetAddOnInfo(i)
		if MCP_FindAddon( list, name ) then
			DisableAddOn(name)
		end
	end

	MCP_Print(string.format("Addon set %s unloaded.", value) )
	MCP_AddonList_OnShow()
end

function MCP_LoadSet_OnClick()

	local value = 	UIDropDownMenu_GetSelectedValue(MCPAddonSetDropDown)
	if not value then return end
	
	local list
	
	if value == 0 then
		list = MCP_DefaultSet
	else
		if not MCP_Config or not MCP_Config.AddonSet or not MCP_Config.AddonSet[value] then return end
		list = MCP_Config.AddonSet[value]
	end
			
	local name 
	for i = 1, GetNumAddOns() do		
		name = GetAddOnInfo(i)
		if MCP_FindAddon( list, name ) then
			EnableAddOn(name)
		end
	end
	
	MCP_Print(string.format("Addon set %s loaded.", value) )
	MCP_AddonList_OnShow()
	
end

function MCP_RenameSet_OnClick()
	local value = UIDropDownMenu_GetSelectedValue(MCPAddonSetDropDown)
	if not value or type(value) ~= "number" or value == 0 then return end
	
	local setName 
	
	if MCP_Config and MCP_Config.AddonSet and MCP_Config.AddonSet[value] and MCP_Config.AddonSet[value].name then 
		setName = MCP_Config.AddonSet[value].name
	else
		setName = "Set " .. value
	end
	
	
	if not MCP_EditBox then
		MCP_EditBox = CreateFrame('Editbox',nil,UIParent)
		MCP_EditBox:SetHeight(25)
		MCP_EditBox:SetWidth(300)
		MCP_EditBox:SetPoint('CENTER',0,0)
		MCP_EditBox:SetFrameStrata("DIALOG")

		MCP_EditBox:SetBackdrop({
			bgFile='Interface\\Tooltips\\UI-Tooltip-Background',
			edgeFile='Interface\\Tooltips\\UI-Tooltip-Border',
			edgeSize=16, tileSize=16, tile=true,
			insets={left=5, right=5, top=5, bottom=5}})

		MCP_EditBox:SetBackdropColor(0,0,0,1)
		MCP_EditBox:SetFont('Fonts\\FRIZQT__.TTF',13)
		MCP_EditBox:SetTextInsets(5,5,0,0)
		
		MCP_EditBox:SetScript('OnEscapePressed',function()
			this:Hide()
		end)
		
		MCP_EditBox:SetScript('OnEnterPressed',function()
			if not MCP_Config then MCP_Config = {} end
			if not MCP_Config.AddonSet then MCP_Config.AddonSet = {} end
			if not MCP_Config.AddonSet[this.setID] then MCP_Config.AddonSet[this.setID] = {} end
			MCP_Config.AddonSet[this.setID].name = this:GetText()
			this:Hide()
		end)	
	end
	
	MCP_EditBox.setID = value
	MCP_EditBox:SetText( setName )
	MCP_EditBox:Show()

end

function MCP_FindAddon(list, name)
	for i, v in ipairs(list) do
		if v == name then
			return true
		end
	end
	return nil
end

function MCP_Print(msg, r, g, b)
	DEFAULT_CHAT_FRAME:AddMessage("MCP: ".. msg, r, g, b)
end

function MCP_TooltipShow(index)
	local name, title, notes, enabled, loadable, reason, security = GetAddOnInfo(index)
	local author = GetAddOnMetadata(name, "Author")
	local version = GetAddOnMetadata(name, "Version")
	local deps = { GetAddOnDependencies(index) }
	
	GameTooltip:SetOwner(this, "ANCHOR_BOTTOMLEFT")
	if title then
	  GameTooltip:AddLine(title)
	else
	  GameTooltip:AddLine(name)
	end
	if author then
		GameTooltip:AddLine(string.format("Author: %s", author), 0, 1, 0, 1)
	end
	if version then
		GameTooltip:AddLine(string.format("Version: %s", version), 0, 1, 0, 1)
	end
	
	if notes then
		GameTooltip:AddLine(notes, 1, 1, 1, 1)
	else
	  GameTooltip:AddLine(MCP_NO_NOTES, 1, 1, 1)
	end
	
	if deps[1] then
		depLine = "Dependencies: "..deps[1]
		 for i = 2, table.getn(deps) do
		 	if deps[i] then
		 		depLine = depLine..", "..deps[i]
		 	end
		 end
		 GameTooltip:AddLine(depLine)
	end
	
	GameTooltip:Show()
  
end


