--==============
-- Global Variables
--==============
rMCP = {}

MCP_LINEHEIGHT = 16

MCP_NO_NOTES = "No information available."
ADDON_LOADED = "Loaded";

--==============
-- Local Variables
--==============

-- This is the list of available addonIndex, which can be number or string.
-- if type(addonIndex) == 'string', it will be shown in the panel as a category header.
-- if addonIndex > GetNumAddOns(), it's a Blizzard addon, the index references to MCP_BLIZZARD_ADDONS[addonIndex - GetNumAddOns()].
-- otherwise, addonIndex is the index used in GetAddOnInfo().
-- this list can be externally accessed via rMCP.sortedAddonList, so that you can build the list with your own sorting criteria.
local sortedAddonList = {}
rMCP.sortedAddonList = sortedAddonList

local savedVar = nil

local MCP_FRAME_NAME = "MCP_AddonList"
local playerClass = nil
local MCP_SET_SIZE = 10
local MCP_MAXADDONS = 20
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


function rMCP:OnLoad()

	UIPanelWindows["MCP_AddonList"] = { area = "center", pushable = 0, whileDead = 1 }
	StaticPopupDialogs["MCP_RELOADUI"] = {
		text = "Reload your User Interface?",
		button1 = TEXT(ACCEPT),
		button2 = TEXT(CANCEL),
		OnAccept = function()
			ReloadUI();
		end,
		timeout = 0,
		hideOnEscape = 1
	}

	local sortByAce2CheckBoxText = getglobal(MCP_FRAME_NAME.."SortByXCategoryText")
	sortByAce2CheckBoxText:SetTextColor(1,1,1)
	sortByAce2CheckBoxText:SetText("Sort by Ace2 Categories")


	local title = "rMasterControlPanel "
	local version = GetAddOnMetadata("rMCP", "Version")
	if version then 
		title = title.." "..version
	end
	MCP_AddonListHeaderTitle:SetText(title)
	this:RegisterEvent("VARIABLES_LOADED")
	
	_, playerClass = UnitClass("player")
	
end


function rMCP:OnEvent(event)

	if event == "VARIABLES_LOADED" then
		if not rMCP_Data then rMCP_Data = {} end
		
		savedVar = rMCP_Data
		
		local sortByAce2CheckBox = getglobal(MCP_FRAME_NAME.."SortByXCategory")
		sortByAce2CheckBox:SetChecked(savedVar.sort)
		
		rMCP:ReloadAddonList()
		
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

function rMCP:BuildAddonList()
	for k in pairs(sortedAddonList) do
		sortedAddonList[k] = nil
	end
	local numAddons = GetNumAddOns()
	for i=1, numAddons do
		table.insert(sortedAddonList, i)		
	end
	for i=1, #MCP_BLIZZARD_ADDONS do
		table.insert(sortedAddonList, numAddons+i)
	end	
end


function rMCP:BuildAddonListByXCategory()
	
	for k in pairs(sortedAddonList) do
		sortedAddonList[k] = nil
	end

	local numAddons = GetNumAddOns()
	for i=1, numAddons do
		table.insert(sortedAddonList, i)		
	end
		
	-- Sort the addon list by Ace2 Categories.
	table.sort(sortedAddonList, function(a, b)
		local catA = GetAddOnMetadata(a, "X-Category")
		local catB = GetAddOnMetadata(b, "X-Category")
		if catA == catB then
			local nameA = GetAddOnInfo(a)
			local nameB = GetAddOnInfo(b)
			return nameA < nameB
		else
			return tostring(catA) < tostring(catB)
		end
	end )
	
	-- Insert the category titles into the list.
	local prevCategory = ""
	for i, addonIndex in ipairs(sortedAddonList) do
		local category = GetAddOnMetadata(addonIndex, "X-Category")
		if not category then 
			category = "Undefined"
		end
		if category ~= prevCategory then
			table.insert(sortedAddonList, i, category)
		end
		prevCategory = category
	end
	
	table.insert(sortedAddonList, "Blizzard")
	
	for i=1, #MCP_BLIZZARD_ADDONS do
		table.insert(sortedAddonList, numAddons+i)
	end
	
	
	
end


function rMCP:ReloadAddonList()
	if savedVar.sort then
		self:BuildAddonListByXCategory()
	else
		self:BuildAddonList()
	end
	rMCP:AddonList_OnShow()
end

function rMCP:AddonList_Enable(index,enabled)
	if (type(index) == "number") then
		if (enabled) then
			EnableAddOn(index);
		else
			DisableAddOn(index);
		end
	end
	rMCP:AddonList_OnShow();
end

function rMCP:AddonList_LoadNow(index)
	UIParentLoadAddOn(index)
	rMCP:AddonList_OnShow()
end

function rMCP:AddonList_OnShow()
	local function setSecurity (obj, idx)
		local width,height,iconWidth = 64,16,16;
		local increment = iconWidth/width;
		local left = (idx-1)*increment;
		local right = idx*increment;
		obj:SetTexCoord(left, right, 0, 1);
	end


	local origNumAddons = GetNumAddOns()
	numAddons = #sortedAddonList
	FauxScrollFrame_Update(MCP_AddonList_ScrollFrame, numAddons, MCP_MAXADDONS, MCP_LINEHEIGHT, nil, nil, nil);
	local i;
	local offset = FauxScrollFrame_GetOffset(MCP_AddonList_ScrollFrame);
	for i = 1, MCP_MAXADDONS, 1 do
		obj = getglobal("MCP_AddonListEntry"..i);
		local addonIdx = sortedAddonList[offset+i];

		if offset+i > #sortedAddonList then
			obj:Hide()
			obj.addon = nil
		else
			local headerText = getglobal("MCP_AddonListEntry"..i.."Header")
			local titleText = getglobal("MCP_AddonListEntry"..i.."Title")
			local status = getglobal("MCP_AddonListEntry"..i.."Status")
			local checkbox = getglobal("MCP_AddonListEntry"..i.."Enabled")
			local securityIcon = getglobal("MCP_AddonListEntry"..i.."SecurityIcon")
			local loadnow = getglobal("MCP_AddonListEntry"..i.."LoadNow")
			
			if type(addonIdx) == 'string' then
				obj.addon = nil
				obj:Show()				
				headerText:SetText(addonIdx)
				headerText:Show()
				titleText:Hide()
				status:Hide()
				checkbox:Hide()
				securityIcon:Hide()
				loadnow:Hide()
			else
				obj:Show()
				titleText:Show()
				status:Show()
				securityIcon:Show()
				headerText:Hide()
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
				if (name == "rMCP" or addonIdx > origNumAddons) then
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
end

function rMCP:SetDropDown_OnShow()

	local info, count
	for i = 1, 	MCP_SET_SIZE do	
		local name = nil
		
		if savedVar.AddonSet and savedVar.AddonSet[i] then
			count = table.getn(savedVar.AddonSet[i])
			name = savedVar.AddonSet[i].name
		else
			count = 0
		end
		
		if not name then name = "Set " .. i end
		
		info = { 
			text = string.format("%s (%d)", name , count),
			func = function() rMCP:SetDropDown_OnClick() end,
			value = i
		}
		
		UIDropDownMenu_AddButton(info)
	end	
	
	if savedVar.AddonSet and savedVar.AddonSet[playerClass] then
		count = table.getn(savedVar.AddonSet[playerClass])
	else
		count = 0
	end
	
	info = { 
		text = string.format("%s (%d)", UnitClass("player"), count),
		func = function() rMCP:SetDropDown_OnClick() end,
		value = playerClass
	}
	UIDropDownMenu_AddButton(info)
	
	info = { 
		text = string.format("Default (%d)", table.getn(MCP_DefaultSet)),
		func = function() rMCP:SetDropDown_OnClick() end,
		value = 0
	}
	UIDropDownMenu_AddButton(info)	
end

function rMCP:SetDropDown_OnClick()
	UIDropDownMenu_SetSelectedValue( MCPAddonSetDropDown, this.value )
end

function rMCP:SaveSet_OnClick()
	local value = 	UIDropDownMenu_GetSelectedValue(MCPAddonSetDropDown)	

	if value and value ~= 0 then
		local setName
		
		if not savedVar.AddonSet then savedVar.AddonSet = {} end
		
		if savedVar.AddonSet[value] then 
			setName = savedVar.AddonSet[value].name
		end
			
		savedVar.AddonSet[value] = { name=setName }
		local name, enabled
		for i = 1, GetNumAddOns() do
			name, _, _, enabled = GetAddOnInfo(i)
			if enabled and name ~= "rMCP" then
				table.insert(savedVar.AddonSet[value], name)
			end
		end
		self:Print(string.format("Saved on set %s.",value))
	end
	
end

function rMCP:UnloadSet_OnClick()
	local value = UIDropDownMenu_GetSelectedValue(MCPAddonSetDropDown)
	if not value then return end

	local list

	if value == 0 then
		list = MCP_DefaultSet
	else
		if not savedVar or not savedVar.AddonSet or not savedVar.AddonSet[value] then return end
		list = savedVar.AddonSet[value]
	end

	local name
	for i = 1, GetNumAddOns() do
		name = GetAddOnInfo(i)
		if rMCP:FindAddon( list, name ) then
			DisableAddOn(name)
		end
	end

	self:Print(string.format("Addon set %s unloaded.", value) )
	rMCP:AddonList_OnShow()
end

function rMCP:LoadSet_OnClick()

	local value = 	UIDropDownMenu_GetSelectedValue(MCPAddonSetDropDown)
	if not value then return end
	
	local list
	
	if value == 0 then
		list = MCP_DefaultSet
	else
		if not savedVar or not savedVar.AddonSet or not savedVar.AddonSet[value] then return end
		list = savedVar.AddonSet[value]
	end
			
	local name 
	for i = 1, GetNumAddOns() do		
		name = GetAddOnInfo(i)
		if rMCP:FindAddon( list, name ) then
			EnableAddOn(name)
		end
	end
	
	self:Print(string.format("Addon set %s loaded.", value) )
	rMCP:AddonList_OnShow()
	
end

function rMCP:RenameSet_OnClick()
	local value = UIDropDownMenu_GetSelectedValue(MCPAddonSetDropDown)
	if not value or type(value) ~= "number" or value == 0 then return end
	
	local setName 
	
	if savedVar and savedVar.AddonSet and savedVar.AddonSet[value] and savedVar.AddonSet[value].name then 
		setName = savedVar.AddonSet[value].name
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
			if not savedVar then savedVar = {} end
			if not savedVar.AddonSet then savedVar.AddonSet = {} end
			if not savedVar.AddonSet[this.setID] then savedVar.AddonSet[this.setID] = {} end
			savedVar.AddonSet[this.setID].name = this:GetText()
			this:Hide()
		end)	
	end
	
	MCP_EditBox.setID = value
	MCP_EditBox:SetText( setName )
	MCP_EditBox:Show()

end

function rMCP:FindAddon(list, name)
	for i, v in ipairs(list) do
		if v == name then
			return true
		end
	end
	return nil
end

function rMCP:Print(msg, r, g, b)
	DEFAULT_CHAT_FRAME:AddMessage("rMCP: ".. msg, r, g, b)
end

function rMCP:ShowTooltip(index)
	if not index then return end
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

function rMCP:ToggleSortByXCategory(checked)
	savedVar.sort = checked
	self:ReloadAddonList()
end
