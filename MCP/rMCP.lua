--==============
-- Global Variables
--==============
rMCP = {}

MCP_LINEHEIGHT = 16

MCP_NO_NOTES = "No information available."
ADDON_LOADED = "Loaded";


--==============
-- Special Tables
--==============

--[[	
	masterAddonList : master list of sorted addons.
	It should be in the following structures:
		masterAddonList = {
			addon1Index,
			addon2Index,
			{
				addon3Index,
				addon4Index,
				...
				['category'] = "Category1Name"
			},
			addon5Index,
			{
				addon6Index,
				addon7Index,
				['category'] = "Category2Name"
			},
		}
		
	This list is used to build sortedAddonList, which is the list used in the FauxScrollFrame.
	
--]]
local masterAddonList = {}
rMCP.masterAddonList = masterAddonList


--[[
	sortedAddonList : list of addonIndexes, which is used by the FauxScrollFrame.
	It should be in the following structure:
		sortedAddonList = {
			addon1Index,
			addon2Index,
			"Category1Name",
			addon3Index,
			addon4Index,
			...,
			addon5Index,
			"Category2Name",
			addon6Index,
			addon7Index,
			...,
		}
		
	if type(addonIndex) == 'string', it will be shown in the panel as a category header. The collapse state will be retrieved from masterAddonList.
	if addonIndex > GetNumAddOns(), it's a Blizzard addon, the index references to MCP_BLIZZARD_ADDONS[addonIndex - GetNumAddOns()].
	otherwise, addonIndex is the index used in GetAddOnInfo().
	
	This list will be rebuilt whenever use expanded/collapsed a category, or when user changed the sorting criteria.
	
--]]
local sortedAddonList = {}
rMCP.sortedAddonList = sortedAddonList

--[[
	addonListBuilders : a table of functions used to build masterAddonList
	
	To define your own sorting criteria, check the default builder functions as examples.
	Note if you create the build function in an external scope, you cannot access to the rMCP local variables,
	  i.e. masterAddonList and MCP_BLIZZARD_ADDONS, but they can be accessed through rMCP. e.g.:
		
		function MyExternalBuilder()
			local masterAddonList = rMCP.masterAddonList
			local bzAddons = rMCP.MCP_BLIZZARD_ADDONS
			(Now build the masterAddonList)
		end
		
	When you have defined your own builder function, simple add them to the table by:
	
		rMCP.addonListBuilders["MyExternalBuilder"] = MyExternalBuilder
		
	After everything is done, the custom defined function can be accessed from the rMCP sorter drop down menu.
	
]]
local addonListBuilders = {}
rMCP.addonListBuilders = addonListBuilders

--==============
-- Reference to tables in saved variables
--==============
local savedVar
local collapsedAddons


--==============
-- Local Variables
--==============
local cache = setmetatable({}, {__mode='k'})
local function acquire()
	local t = next(cache) or {}
	cache[t] = nil
	return t
end
local function reclaim(t)
	for k in pairs(t) do
		t[k] = nil
	end
	cache[t] = true
end
local MCP_ADDON_NAME = "MCP"
local MCP_FRAME_NAME = "MCP_AddonList"
local playerClass = nil
local MCP_SET_SIZE = 10
local MCP_MAXADDONS = 20
local MCP_EditBox
local MCP_DefaultSet = {}
local MCP_DEFAULT_SET = 0
local MCP_BLIZZARD_ADDONS = {
	"Blizzard_AuctionUI",
	"Blizzard_BattlefieldMinimap",
	"Blizzard_BindingUI",
	"Blizzard_CombatText",
	"Blizzard_CraftUI",
	"Blizzard_GMSurveyUI",
	"Blizzard_InspectUI",
	"Blizzard_ItemSocketingUI",
	"Blizzard_MacroUI",
	"Blizzard_RaidUI",
	"Blizzard_TalentUI",
	"Blizzard_TradeSkillUI",
	"Blizzard_TrainerUI",
}
local MCP_BLIZZARD_ADDONS_TITLES = {
	"Blizzard: Auction",
	"Blizzard: Battlefield Minimap",
	"Blizzard: Binding",
	"Blizzard: Combat Text",
	"Blizzard: Craft",
	"Blizzard: GM Survey",
	"Blizzard: Inspect",
	"Blizzard: Item Socketing",
	"Blizzard: Macro",
	"Blizzard: Raid",
	"Blizzard: Talent",
	"Blizzard: Trade Skill",
	"Blizzard: Trainer",
}
rMCP.MCP_BLIZZARD_ADDONS = MCP_BLIZZARD_ADDONS

local enabledList -- Used to prevent recursive loop in EnableAddon.

local function ParseVersion(version)
	if type(version) == "string" then
		if version:find("%$Revision: (%d+) %$") then
			version = version:gsub("%$Revision: (%d+) %$", "%1")
		elseif version:find("%$Rev: (%d+) %$") then
			version = version:gsub("%$Rev: (%d+) %$", "%1")
		elseif version:find("%$LastChangedRevision: (%d+) %$") then
			version = version:gsub("%$LastChangedRevision: (%d+) %$", "%1")
		end
		version = version:trim()
	end
	return version
end

local function toggle(flag)
	if flag then
		return nil
	else
		return true
	end
end


function rMCP:OnLoad()

	UIPanelWindows[MCP_FRAME_NAME] = { area = "center", pushable = 0, whileDead = 1 }
	StaticPopupDialogs["MCP_RELOADUI"] = {
		text = "Reload your User Interface?",
		button1 = TEXT(ACCEPT),
		button2 = TEXT(CANCEL),
		OnAccept = function()
			ReloadUI();
		end,
		timeout = 0,
		hideOnEscape = 1,
		whileDead = 1
	}


	local title = "rMasterControlPanel "
	local version = GetAddOnMetadata(MCP_ADDON_NAME, "Version")
	if version then
		version = ParseVersion(version)
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
		
		if not savedVar.collapsed then
			savedVar.collapsed = {}
		end
		collapsedAddons = savedVar.collapsed
		
		rMCP:ReloadAddonList()
			
		for i = 1, GetNumAddOns() do
			if IsAddOnLoaded(i) then
				local name = GetAddOnInfo(i)
				if name ~= MCP_ADDON_NAME then
					table.insert(MCP_DefaultSet, name)
				end
			end
		end
		
		this:UnregisterEvent("VARIABLES_LOADED")
	end
	
end


addonListBuilders["Default"] = function()
	for k in pairs(masterAddonList) do
		masterAddonList[k] = nil
	end
	local numAddons = GetNumAddOns()
	for i=1, numAddons do
		table.insert(masterAddonList, i)		
	end
	for i=1, #MCP_BLIZZARD_ADDONS do
		table.insert(masterAddonList, numAddons+i)
	end
end


addonListBuilders["Ace2"] = function()

	local t = {}

	local numAddons = GetNumAddOns()
	for i=1, numAddons do
		table.insert(t, i)		
	end
		
	-- Sort the addon list by Ace2 Categories.
	table.sort(t, function(a, b)
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
	for i, addonIndex in ipairs(t) do
		local category = GetAddOnMetadata(addonIndex, "X-Category")
		if not category then
			category = "Undefined"
		end
		if category ~= prevCategory then
			table.insert(t, i, category)
		end
		prevCategory = category
	end
	
	table.insert(t, "Blizzard")
	
	for i=1, #MCP_BLIZZARD_ADDONS do
		table.insert(t, numAddons+i)
	end
	
	-- Now build the masterAddonList.
	for k in pairs(masterAddonList) do
		masterAddonList[k] = nil
	end
	local list = masterAddonList
	local currPos = list
	for i, addon in ipairs(t) do
		if type(addon) == 'string' then
			local t = {}
			t.category = addon
			table.insert(list, t)
			currPos = t
		else
			table.insert(currPos, addon)
		end
	end
	
	
end


addonListBuilders["Author"] = function()
	local t = {}

	local numAddons = GetNumAddOns()
	for i=1, numAddons do
		table.insert(t, i)		
	end
		
	-- Sort the addon list by Ace2 Categories.
	table.sort(t, function(a, b)
		local catA = GetAddOnMetadata(a, "Author")
		local catB = GetAddOnMetadata(b, "Author")
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
	for i, addonIndex in ipairs(t) do
		local category = GetAddOnMetadata(addonIndex, "Author")
		if not category then
			category = "Unknown"
		end
		if category ~= prevCategory then
			table.insert(t, i, category)
		end
		prevCategory = category
	end
	
	table.insert(t, "Blizzard")
	
	for i=1, #MCP_BLIZZARD_ADDONS do
		table.insert(t, numAddons+i)
	end
	
	-- Now build the masterAddonList.
	for k in pairs(masterAddonList) do
		masterAddonList[k] = nil
	end
	local list = masterAddonList
	local currPos = list
	for i, addon in ipairs(t) do
		if type(addon) == 'string' then
			local t = {}
			t.category = addon
			table.insert(list, t)
			currPos = t
		else
			table.insert(currPos, addon)
		end
	end
	
end

function rMCP:ReloadAddonList()

	local builder = savedVar.sorter
	if not builder then
		builder = "Default"
	end
	
	local func = addonListBuilders[builder]
	if not func then
		func = addonListBuilders["Default"]
	end
	
	func()
	
	self:RebuildSortedAddonList()
	rMCP:AddonList_OnShow()
	

	MCP_AddonListSortDropDownText:SetText(builder)
	local button = getglobal(MCP_FRAME_NAME.."SortDropDown")
	UIDropDownMenu_SetSelectedValue( button, builder)
	
end


function rMCP:EnableAddon(addon)
	local name = GetAddOnInfo(addon)
	if not enabledList[name] then
		EnableAddOn(addon)
		enabledList[name] = true
		self:EnableDependencies(name)
	end	
end


function rMCP:ReadDependencies(t, ...)
	for k in pairs(t) do
		t[k] = nil
	end
	for i=1, select('#', ...) do
		local name = select(i, ...)
		if name then
			t[name] = true
		end
	end
	return t
end

function rMCP:EnableDependencies(addon)
	local deps = self:ReadDependencies(acquire(), GetAddOnDependencies(addon))
	
	if next(deps) then
		for k in pairs(deps) do
			self:EnableAddon(k)
		end
	end
	
	reclaim(deps)
	
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

function rMCP:CollapseAll(collapse)
	local categories = {}
	
	for i, addon in ipairs(masterAddonList) do
		if type(addon) == 'table' and addon.category then
			table.insert(categories, addon.category)
		end
	end
	
	
	for i, category in ipairs(categories) do
		collapsedAddons[category] = collapse
	end
		
	self:RebuildSortedAddonList()
end

function rMCP:SaveSet(set)
	if not savedVar.AddonSet then
		savedVar.AddonSet = {}
	end
	
	if not savedVar.AddonSet[set] then
		savedVar.AddonSet[set] = {}
	end	
	
	local addonSet = savedVar.AddonSet[set]
	
	local setName = addonSet.name
	for k in pairs(addonSet) do
		addonSet[k] = nil
	end	
	
	addonSet.name = setName
	
	local name, enabled
	for i = 1, GetNumAddOns() do
		name, _, _, enabled = GetAddOnInfo(i)
		if enabled and name ~= MCP_ADDON_NAME then
			table.insert(addonSet, name)
		end
	end
	
	self:Print("Addons " .. self:GetSetName(set) .. " Saved." )

	CloseDropDownMenus(1)
	
end

function rMCP:GetSetName(set)
	if set == MCP_DEFAULT_SET then
		return "Default"
	elseif savedVar and savedVar.AddonSet and savedVar.AddonSet[set] and savedVar.AddonSet[set].name then
		return savedVar.AddonSet[set].name
	else
		return "Set " .. set
	end
end

function rMCP:UnloadSet(set)

	local list

	if set == MCP_DEFAULT_SET then
		list = MCP_DefaultSet
	else
		if not savedVar or not savedVar.AddonSet or not savedVar.AddonSet[set] then return end
		list = savedVar.AddonSet[set]
	end

	local name
	for i = 1, GetNumAddOns() do
		name = GetAddOnInfo(i)
		if name ~= MCP_ADDON_NAME and rMCP:FindAddon( list, name ) then
			DisableAddOn(name)
		end
	end

	self:Print("Addons " .. self:GetSetName(set) .. " Unloaded." )
	rMCP:AddonList_OnShow()
end

function rMCP:LoadSet(set)


	local list
	
	if set == MCP_DEFAULT_SET then
		list = MCP_DefaultSet
	else
		if not savedVar or not savedVar.AddonSet or not savedVar.AddonSet[set] then return end
		list = savedVar.AddonSet[set]
	end
	
	enabledList = acquire()
	local name
	for i = 1, GetNumAddOns() do		
		name = GetAddOnInfo(i)
		if rMCP:FindAddon( list, name ) then
			self:EnableAddon(name)
		end
	end
	
	reclaim(enabledList)
	enabledList = nil
	
	self:Print("Addons " .. self:GetSetName(set) .. " Loaded." )
	rMCP:AddonList_OnShow()
	
end

function rMCP:RenameSet(set)

	
	local setName
	
	if savedVar and savedVar.AddonSet and savedVar.AddonSet[set] and savedVar.AddonSet[set].name then
		setName = savedVar.AddonSet[set].name
	else
		setName = "Set " .. set
	end
	
	if not MCP_EditBox then
		self:CreateEditBox()
	end
	
	
	self.renamingSet = set
	MCP_EditBox:SetText( setName )
	MCP_EditBox:Show()
	
	CloseDropDownMenus(1)

end

function rMCP:CreateEditBox()
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
		local set = self.renamingSet
		if set then
			if not savedVar then savedVar = {} end
			if not savedVar.AddonSet then savedVar.AddonSet = {} end
			if not savedVar.AddonSet[set] then savedVar.AddonSet[set] = {} end
			savedVar.AddonSet[set].name = this:GetText()
		end
		this:Hide()
	end)

end

-- Rebuild sortedAddonList from masterAddonList
function rMCP:RebuildSortedAddonList()
	for k in pairs(sortedAddonList) do
		sortedAddonList[k] = nil
	end

	for i, addon in ipairs(masterAddonList) do
		if type(addon) ~= 'table' then
			table.insert(sortedAddonList, addon)
		else
			local category = addon.category
			if category then
				table.insert(sortedAddonList, category)
			end
			if not category or not collapsedAddons[category] then
				for j, subAddon in ipairs(addon) do
					table.insert(sortedAddonList, subAddon)
				end		
			end			
		end
	end	
	
	
end

function rMCP:SetMasterAddonBuilder(sorter)
	if not addonListBuilders[sorter] or not savedVar then return end	
	for k in pairs(collapsedAddons) do
		collapsedAddons[k] = nil
	end
	savedVar.sorter = sorter
	self:ReloadAddonList()
end

-- UI Controllers.

function rMCP:SortDropDown_OnLoad()
	local info
	for name, func in pairs(addonListBuilders) do
		info = UIDropDownMenu_CreateInfo()
		info.text = name
		info.func = function() self:SetMasterAddonBuilder(name) end
		UIDropDownMenu_AddButton(info)
	end
end

function rMCP:SortDropDown_OnClick(sorter)

end


function rMCP:DisableAll_OnClick()
	DisableAllAddOns()
	EnableAddOn(MCP_ADDON_NAME)
	self:AddonList_OnShow()
end

function rMCP:Collapse_OnClick(obj)

	local category = obj.category
	if not category then return end
	
	collapsedAddons[category] = toggle(collapsedAddons[category])
	
	self:RebuildSortedAddonList()
	self:AddonList_OnShow()

end

function rMCP:CollapseAll_OnClick()
	local obj = getglobal(MCP_FRAME_NAME.."CollapseAll")
	local icon = getglobal(MCP_FRAME_NAME.."CollapseAllIcon")
	obj.collapsed = toggle(obj.collapsed)
	if obj.collapsed then
		icon:SetTexture("Interface\\Minimap\\UI-Minimap-ZoomInButton-Up")
	else
		icon:SetTexture("Interface\\Minimap\\UI-Minimap-ZoomOutButton-Up")
	end
	self:CollapseAll(obj.collapsed)
	self:AddonList_OnShow()
end

function rMCP:AddonList_Enable(addonIndex,enabled)
	if (type(addonIndex) == "number") then
		if (enabled) then
			enabledList = acquire()
			self:EnableAddon(addonIndex)
			reclaim(enabledList)
			enabledList = nil
		else
			DisableAddOn(addonIndex);
		end
	end
	self:AddonList_OnShow();
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
			local securityButton = getglobal("MCP_AddonListEntry"..i.."Security")
			local securityIcon = getglobal("MCP_AddonListEntry"..i.."SecurityIcon")
			local loadnow = getglobal("MCP_AddonListEntry"..i.."LoadNow")
			local collapse = getglobal("MCP_AddonListEntry"..i.."Collapse")
			local collapseIcon = getglobal("MCP_AddonListEntry"..i.."CollapseIcon")
			
			if type(addonIdx) == 'string' then
				obj.addon = nil
				obj.category = addonIdx
				obj:Show()
				headerText:SetText(addonIdx)
				headerText:Show()
				titleText:Hide()
				status:Hide()
				checkbox:Hide()
				securityButton:Hide()
				loadnow:Hide()
				if collapsedAddons[addonIdx] then
					collapseIcon:SetTexture("Interface\\Minimap\\UI-Minimap-ZoomInButton-Up")
				else
					collapseIcon:SetTexture("Interface\\Minimap\\UI-Minimap-ZoomOutButton-Up")
				end
				collapse:Show()
			else
				obj.category = nil
				obj:Show()
				titleText:Show()
				status:Show()
				securityButton:Show()
				headerText:Hide()
				collapse:Hide()
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
				if (name == MCP_ADDON_NAME or addonIdx > origNumAddons) then
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


function rMCP:SetDropDown_OnLoad()
	if not savedVar then return end
	
	if UIDROPDOWNMENU_MENU_LEVEL == 1 then

		local info, count, name
		for i = 1, 	MCP_SET_SIZE do
			local name = nil
			
			info = UIDropDownMenu_CreateInfo()
			if savedVar.AddonSet and savedVar.AddonSet[i] then
				count = table.getn(savedVar.AddonSet[i])
				name = savedVar.AddonSet[i].name
			else		
				count = 0
			end
			
			if not name then
				name = "Set " .. i
			end
			
			info = UIDropDownMenu_CreateInfo()
			info.text = string.format("%s (%d)", name, count)
			info.value = i
			info.hasArrow = 1
			info.notCheckable = 1
			UIDropDownMenu_AddButton(info)
		end	
		
		-- Class set.
		if savedVar.AddonSet and savedVar.AddonSet[playerClass] then
			count = table.getn(savedVar.AddonSet[playerClass])
		else
			count = 0
		end	
		info = UIDropDownMenu_CreateInfo()
		info.text = string.format("%s (%d)", playerClass, count)
		info.value = playerClass
		info.hasArrow = 1
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info)
		
		-- Default set.
		info = UIDropDownMenu_CreateInfo()
		info.text = string.format("Default (%d)", table.getn(MCP_DefaultSet))
		info.value = MCP_DEFAULT_SET
		info.hasArrow = 1
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info)
	
	elseif UIDROPDOWNMENU_MENU_LEVEL == 2 then
	
		local setName = self:GetSetName(UIDROPDOWNMENU_MENU_VALUE)
		info = UIDropDownMenu_CreateInfo()
		info.text = setName
		info.isTitle = 1
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
		
		
		if UIDROPDOWNMENU_MENU_VALUE ~= MCP_DEFAULT_SET then
			info = UIDropDownMenu_CreateInfo()
			info.text = "Save"
			info.func = function() self:SaveSet(UIDROPDOWNMENU_MENU_VALUE) end
			info.notCheckable = 1
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
		end
		
		info = UIDropDownMenu_CreateInfo()
		info.text = "Load"
		info.func = function() self:LoadSet(UIDROPDOWNMENU_MENU_VALUE) end
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
		
		
		info = UIDropDownMenu_CreateInfo()
		info.text = "Unload"
		info.func = function() self:UnloadSet(UIDROPDOWNMENU_MENU_VALUE) end
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
		
		if UIDROPDOWNMENU_MENU_VALUE ~= MCP_DEFAULT_SET and UIDROPDOWNMENU_MENU_VALUE ~= playerClass then
			info = UIDropDownMenu_CreateInfo()
			info.text = "Rename"
			info.func = function() self:RenameSet(UIDROPDOWNMENU_MENU_VALUE) end
			info.notCheckable = 1
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
		end
	
	end
	

	
end

function rMCP:ShowTooltip(index)
	if not index then return end
	local name, title, notes, enabled, loadable, reason, security = GetAddOnInfo(index)
	local author = GetAddOnMetadata(name, "Author")
	local version = ParseVersion(GetAddOnMetadata(name, "Version"))
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

