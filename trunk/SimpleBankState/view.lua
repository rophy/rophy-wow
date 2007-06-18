local core = SimpleBankState
if not core then return end

local moduleName = "SimpleBankStateView"
local parent = core:HasModule("SimpleBankStateData") or core
local view = parent:NewModule(moduleName)
local dewdrop = AceLibrary and AceLibrary:HasInstance('Dewdrop-2.0') and AceLibrary('Dewdrop-2.0')

-- Basic settings.
local SCROLL_LIST_SIZE = 20
local ITEM_LINK_WIDTH = 180
local ITEM_COUNT_WIDTH = 60
local ITEM_OWNER_WIDTH = 100
local ITEM_BAG_ID_WIDTH = 90
local ITEM_TYPE_WIDTH = 170
local ITEM_EQUIP_LOC_WIDTH = 100
local ROW_HEIGHT = 20

-- Constants
local EQUIP_ID = 100 -- Index of equipment in saved variables.
local MAIL_ID = 101

local HEADER_RARITY = 0
local HEADER_ITEM = 1
local HEADER_QUANTITY = 2
local HEADER_OWNER = 3
local HEADER_LOCATION = 4
local HEADER_TYPE = 5
local HEADER_EQUIPLOC = 6

local VERSION = tonumber(GetAddOnMetadata('SimpleBankState', 'Version'):match("(%d+)") or 1)


--local globals
local me = UnitName("player"); --the name of the current player that's logged on
local realm = GetRealmName(); --what realm we're on

local tab
local searchFrame
local controllers = {}
local rarityTexts
local itemTypes = {}
local L = core:GetLocale()

local db

local filters = {
	owner = {},
	type = {},
	subType = {},
	location = {
		["BAG"] = true,
		["BANK"] = true,
		["MAIL"] = true,
		["INVENTORY"] = true,
	},
	rarity = {
		[0] = true,
		[1] = true,
		[2] = true,
		[3] = true,
		[4] = true,
		[5] = true,
		[6] = true,
	},
	equipLoc = {
		[""] = true,
		["INVTYPE_AMMO"] = true,
		["INVTYPE_HEAD"] = true,
		["INVTYPE_NECK"] = true,
		["INVTYPE_SHOULDER"] = true,
		["INVTYPE_BODY"] = true,
		["INVTYPE_CHEST"] = true,
		["INVTYPE_ROBE"] = true,
		["INVTYPE_WAIST"] = true,
		["INVTYPE_LEGS"] = true,
		["INVTYPE_FEET"] = true,
		["INVTYPE_WRIST"] = true,
		["INVTYPE_HAND"] = true,
		["INVTYPE_FINGER"] = true,
		["INVTYPE_TRINKET"] = true,
		["INVTYPE_CLOAK"] = true,
		["INVTYPE_WEAPON"] = true,
		["INVTYPE_SHIELD"] = true,
		["INVTYPE_2HWEAPON"] = true,
		["INVTYPE_WEAPONMAINHAND"] = true,
		["INVTYPE_WEAPONOFFHAND"] = true,
		["INVTYPE_HOLDABLE"] = true,
		["INVTYPE_RANGED"] = true,
		["INVTYPE_THROWN"] = true,
		["INVTYPE_RANGEDRIGHT"] = true,
		["INVTYPE_RELIC"] = true,
		["INVTYPE_TABARD"] = true,
		["INVTYPE_BAG"] = true,
	}

}


local function GetReturn(index, ...)
	return select(index, ...)
end


function view:Initialize()
	
	self.data = SBS_Data
	
	local defaults = {
		profile = {
			hideColumns = {
				[HEADER_EQUIPLOC] = true,
				[HEADER_TYPE] = true
			}
		}
	}
	db = self:InitializeDB("SimpleBankStateViewData", defaults)
	
	local cmd = view:InitializeSlashCommand("SimpleBankState Slash Command", "SIMPLEBANKSTATE", "sbs")
	cmd:RegisterSlashHandler("Toggle the search frame.", "^$", "ToggleFrame")
	
	for name in pairs(self.data[realm]) do
		filters.owner[name] = true
	end
	
	self:CreateSearchFrame():Hide()
	
end

local function HideTooltip(frame)
	if GameTooltip:IsVisible() then
		GameTooltip:Hide()
	end
end

function view:CreateSearchFrame()
	if not searchFrame then
		
		self.itemIcons = {}
		self.itemEquipLoc = {}
		
		-- Create the main frame.
		searchFrame = CreateFrame("Frame", 'SimpleBankStateSearchFrame')
		searchFrame:SetWidth(485)
		searchFrame:SetHeight(485)
		searchFrame:SetPoint("CENTER")
		searchFrame:SetClampedToScreen(true)
		searchFrame:SetBackdrop({
			bgFile="Interface/DialogFrame/UI-DialogBox-Background",
			edgeFile="Interface/DialogFrame/UI-DialogBox-Border",
			tile=true,
			tileSize=32,
			edgeSize=32,
			insets = { left=11, right=12, top=12, bottom=11 },
		})
		searchFrame:SetMovable(true)
		
		local frame, fontString, texture
		
		-- Header frame.
		frame = CreateFrame("Frame", nil, searchFrame, "OptionFrameBoxTemplate")
		searchFrame.headerFrame = frame
		frame:SetWidth(365)
		frame:SetHeight(30)
		frame:SetPoint("BOTTOM", searchFrame, "TOP", 0, -5)
		frame:SetBackdropColor(0.4, 0.4, 0.4)
		frame:SetToplevel(false)
		frame:EnableMouse(true)
		frame:RegisterForDrag("LeftButton")
		frame:SetScript("OnDragStart", function(this) searchFrame:StartMoving() end)
		frame:SetScript("OnDragStop", function(this) searchFrame:StopMovingOrSizing() end)
		fontString = frame:CreateFontString(nil, "BACKGROUND", "GameFontNormal")
		fontString:SetPoint("CENTER")
		local title = string.format("SimpleBankState rev.%s", VERSION)
		fontString:SetText(title)
		
		-- Close Button.
		frame = CreateFrame("Button", nil, searchFrame, "UIPanelCloseButton")
		frame:SetFrameLevel(searchFrame.headerFrame:GetFrameLevel()+2)
		searchFrame.closeButton = frame
		frame:SetPoint("CENTER", searchFrame.headerFrame, "RIGHT", -17, 0)
		
		-- Column List Button
		frame = CreateFrame("Button", nil, searchFrame, "UIPanelButtonTemplate")
		frame:SetPoint("TOPLEFT", searchFrame, "TOPLEFT", 14, -12)
		frame:SetWidth(24)
		frame:SetHeight(24)
		frame:SetText("S")
		frame:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		frame:SetScript("OnClick", controllers.onClickColumnSelect)
		frame:SetScript("OnEnter", function(this)
			GameTooltip:SetOwner(this, "ANCHOR_BOTTOMRIGHT")
			GameTooltip:SetText(L["Left-Click to select what columns to show, Alt-Right-Click to reset all filters."])
		end)
		frame:SetScript("OnLeave", HideTooltip)
		
		-- "Search:" text.
		fontString = searchFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
		fontString:SetWidth(fontString:GetStringWidth())
		fontString:SetHeight(20)
		fontString:SetPoint("BOTTOMLEFT", searchFrame, "BOTTOMLEFT", 14, 14)
		fontString:SetText(L["Search:"])
		
		-- Search Box.
		frame = CreateFrame("EditBox", nil, searchFrame, "InputBoxTemplate")
		searchFrame.editBox = frame
		frame:SetAutoFocus(false)
		frame:ClearFocus()
		frame:SetMaxLetters(256)
		frame:SetWidth(180)
		frame:SetHeight(20)
		frame:SetPoint("TOPLEFT", fontString, "TOPRIGHT", 10, 0)
		frame:SetScript("OnEscapePressed", function(this) this:ClearFocus() end )
		frame:SetScript("OnEnterPressed", function(this) view:SearchItem2() end )
		
		-- Refresh Button.
		frame = CreateFrame("Button", nil, searchFrame, "UIPanelButtonTemplate")
		frame:SetWidth(60)
		frame:SetHeight(20)
		frame:SetPoint("TOPLEFT", searchFrame.editBox, "TOPRIGHT", 10, 0)
		frame:SetText(L["Refresh"])
		frame:SetScript("OnClick", function(this)
			view:RefreshItemList()
		end)
		
		-- Slider
		local slider = CreateFrame('Slider', nil, searchFrame, 'UIPanelScrollBarTemplate')
		frame.slider = slider
		slider:SetPoint("TOPRIGHT", searchFrame, "TOPRIGHT", -12, -28)
		slider:SetPoint("BOTTOMRIGHT", searchFrame, "BOTTOMRIGHT", -12, 26)
		slider:SetValue(1)
		slider:SetValueStep(1)
		slider:SetMinMaxValues(1,1)
		tab = DongleStub("Tabulous-0"):Create(
		'rows', SCROLL_LIST_SIZE,
		'columns', 6,
		'slider', slider,
		'header1text', L["Item Name"],
		'header2text', L["Quantity"],
		'header3text', L["Owner"],
		'header4text', L["Location"],
		'header5text', L["Type"],
		'header6text', L["Equip Loc"],
		'columnWidth1', ITEM_LINK_WIDTH,
		'columnWidth2', ITEM_COUNT_WIDTH,
		'columnWidth3', ITEM_OWNER_WIDTH,
		'columnWidth4', ITEM_BAG_ID_WIDTH,
		'columnWidth5', ITEM_TYPE_WIDTH,
		'columnWidth6', ITEM_EQUIP_LOC_WIDTH,
		'rowHeight', ROW_HEIGHT,
		'onClickRow', controllers.OnClickRow,
		'onEnterRow', controllers.OnEnterRow,
		'onLeaveRow', controllers.OnLeaveRow,
		'onInitHeader', function(column, button, fontString)
			button:SetScript("OnEnter", function(this)
				GameTooltip:SetOwner(this, "ANCHOR_BOTTOMRIGHT")
				if column == HEADER_ITEM or column == HEADER_QUANTITY then
					GameTooltip:SetText(L["Left-Click to sort."])
				else
					GameTooltip:SetText(L["Left-Click to sort, Right-Click to filter."])
				end
			end)
			button:SetScript("OnLeave", HideTooltip)
			button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
			button:SetScript("OnClick", function(button, arg1)
				if arg1 == "LeftButton" then
					controllers.onClickHeaderButton(this,column)
				elseif arg1 == "RightButton" then
					controllers.onRightClickHeaderButton(this,column)
				end
			end)
		end,
		'onInitRow', function(row,frame)
			local texture = frame:CreateTexture()
			texture:SetWidth(ROW_HEIGHT)
			texture:SetHeight(ROW_HEIGHT)
			texture:SetPoint("TOPRIGHT", frame, "TOPLEFT", -2, 0)
			self.itemIcons[row] = texture
			frame:SetHighlightTexture("Interface\\HelpFrame\\HelpFrameButton-Highlight")
			frame:GetHighlightTexture():SetTexCoord(0,1.0,0,0.578125)
		end
		)
		tab:SetValueChangeFunction( function(offset) view:OnValueChange(offset) end )
		
		-- Rarity Header.
		local parent = tab:GetHeaderButton(1)
		frame = CreateFrame("Button", nil, parent)
		frame:SetWidth(80)
		frame:SetHeight(20)
		frame:SetPoint("TOPLEFT", parent, 'TOPRIGHT', 10, 0)
		frame.text = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
		frame.text:SetJustifyH("LEFT")
		frame.text:SetAllPoints()
		frame.text:SetText(L["Rarity"])
		frame:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		frame:SetScript("OnClick", function(button, arg1)
			if arg1 == "LeftButton" then
				controllers.onClickHeaderButton(this,0)
			elseif arg1 == "RightButton" then
				controllers.onRightClickHeaderButton(this,0)
			end
		end)
		frame:SetScript("OnEnter", function(this)
			GameTooltip:SetOwner(this, "ANCHOR_BOTTOMRIGHT")
			GameTooltip:SetText(L["Left-Click to sort, Right-Click to filter."])
		end)
		frame:SetScript("OnLeave", HideTooltip)
		searchFrame.rarityText = frame.text
		
		frame = tab:GetFrame()
		searchFrame:SetHeight(frame:GetHeight()+ 30 + searchFrame.editBox:GetHeight())
		searchFrame:SetWidth(frame:GetWidth()+ 30 + ROW_HEIGHT )
		frame:SetParent(searchFrame)
		frame:SetPoint("TOPLEFT", searchFrame, "TOPLEFT", 18 + ROW_HEIGHT, -12)
		frame:SetPoint("BOTTOMRIGHT", searchFrame, "BOTTOMRIGHT", -12, 42 )

		local newWidth = searchFrame:GetWidth()
		for column, hide in pairs(db.profile.hideColumns) do
			if hide then
				newWidth = tab:HideColumn(column) + 30
			end
		end
		if newWidth < 400 then
			newWidth = 400
		end
		searchFrame:SetWidth(newWidth)
	
		self.tab = tab

		table.insert(UISpecialFrames, "SimpleBankStateSearchFrame")
	end
	return searchFrame
end

function view:OnRightClickHeaderButton(column)
	local newWidth = self.tab:HideColumn(column)
	searchFrame:SetWidth(newWidth+24)
end






function view:UpdateVersion()
	self.data.version = self.version;
end


--------------------------
-- Data Recording
--------------------------




function view:IsBankBag(bagID)
	if bagID == BANK_CONTAINER or ( bagID >= 5 and bagID <= 10 ) then
		return true
	end
end


function view:GetBagType(bagID)
	if bagID == EQUIP_ID then
		return "INVENTORY";
	elseif bagID == MAIL_ID then
		return "MAIL";
	elseif self:IsBankBag(bagID) then
		return "BANK";
	else
		return "BAG";
	end
end


------------------------------------------------------------------------
-- The item list suitable for FauxScrollFrame
------------------------------------------------------------------------

--[[
	ItemList = {
		item1link,
		item1cout,
		item1owner,
		item1bagid,
		item2name,
		item2count,
		item2owner,
		item2bagid,
		...
	}
	indexMap = {1,5,9,13...}
]]
local ItemList = {}
do
	local indexMap = {}
	local returnIndex
	local sorting = function(a,b)
			
	end
--[[
	[1] = Name
	[2] = Quantity
	[3] = Owner
	[4] = BagID
	[5] = Rarity
	[6] = Item Type and Sub Type
	[7] = Item Sub Type (currently not used)
	[8] = Inventroy Slot
	position = asc, negative = desc
]]
	local sorter = {
		[1] = function(a,b) return GetItemInfo(ItemList[a]) < GetItemInfo(ItemList[b]) end,
		[2] = function(a,b) return ItemList[a+1] < ItemList[b+1] end,
		[3] = function(a,b) return ItemList[a+2] < ItemList[b+2] end,
		[4] = function(a,b) return ItemList[a+3] < ItemList[b+3] end,
		[5] = function(a,b) return GetReturn(3, GetItemInfo(ItemList[a])) < GetReturn(3, GetItemInfo(ItemList[b])) end,
		[6] = function(a,b) 
			local idA, idB = ItemList[a], ItemList[b]
			local _, _, _, _, _, iTypeA, iSubTypeA = GetItemInfo(idA)
			local _, _, _, _, _, iTypeB, iSubTypeB = GetItemInfo(idB)
			if iTypeA == iTypeB then
				return iSubTypeA < iSubTypeB
			else
				return iTypeA < iTypeB
			end
		end,
		[7] = function(a,b) return GetReturn(7, GetItemInfo(ItemList[a])) < GetReturn(7, GetItemInfo(ItemList[b])) end,
		[8] = function(a,b) return GetReturn(9, GetItemInfo(ItemList[a])) < GetReturn(9, GetItemInfo(ItemList[b])) end,
		[-1] = function(a,b) return GetItemInfo(ItemList[a]) > GetItemInfo(ItemList[b]) end,
		[-2] = function(a,b) return ItemList[a+1] > ItemList[b+1] end,
		[-3] = function(a,b) return ItemList[a+2] > ItemList[b+2] end,
		[-4] = function(a,b) return ItemList[a+3] > ItemList[b+3] end,
		[-5] = function(a,b) return GetReturn(3, GetItemInfo(ItemList[a])) > GetReturn(3, GetItemInfo(ItemList[b])) end,
		[-6] = function(a,b)
			local idA, idB = ItemList[a], ItemList[b]
			local _, _, _, _, _, iTypeA, iSubTypeA = GetItemInfo(idA)
			local _, _, _, _, _, iTypeB, iSubTypeB = GetItemInfo(idB)
			if iTypeA == iTypeB then
				return iSubTypeA > iSubTypeB
			else
				return iTypeA > iTypeB
			end
		end,
		[-7] = function(a,b) return GetReturn(7, GetItemInfo(ItemList[a])) > GetReturn(7, GetItemInfo(ItemList[b])) end,
		[-8] = function(a,b) return GetReturn(9, GetItemInfo(ItemList[a])) > GetReturn(9, GetItemInfo(ItemList[b])) end,
	}
	function ItemList:GetSize()
		return #indexMap
	end
	function ItemList:Sort(key)
		view:Debug(2, "Sorting...")
		table.sort(indexMap,sorter[key])
	end
	function ItemList:Clear()
		for i=#self,1,-1 do
			table.remove(self,i)
		end
		for k in pairs(indexMap) do
			indexMap[k] = nil
		end
	end
	function ItemList:Add(link,count,owner,bagID)
		table.insert(indexMap, #self+1)
		table.insert(self,link or "ERROR")
		table.insert(self,count or "ERROR")
		table.insert(self,owner or "ERROR")
		table.insert(self,bagID or "ERROR")
	end
	function ItemList:Get(index)
		return self[indexMap[index]], self[indexMap[index]+1], self[indexMap[index]+2], self[indexMap[index]+3]
	end
end


local filterToColumn = {
	rarity = HEADER_RARITY,
	owner = HEADER_OWNER,
	equipLoc = HEADER_EQUIPLOC,
	type = HEADER_TYPE,
	subType = HEADER_TYPE,
	location = HEADER_LOCATION,
}
local ToggleFilter 
function ToggleFilter(filter,value,flag,exclusive)
	if flag ~= nil then
		filters[filter][value] = flag
	else
		filters[filter][value] = not filters[filter][value]
	end
	flag = filters[filter][value]
	if exclusive then
		for k,v in pairs(filters[filter]) do
			if k ~= value then
				filters[filter][k] = not flag
			end
		end
	end
	view:RefreshHeaderTitle(filterToColumn[filter])
	view:RefreshItemList()
	
end
local ResetFilters
function ResetFilters()
	for filter, values in pairs(filters) do
		for value in pairs(values) do
			values[value] = true
		end
	end
end
view.filters = filters

function view:BuildIndex()

	self:Debug(2, "Rebuilding item list")
	
	local itemInfo, itemName, itemLink, itemQuality, itemCount;
	
	local listSize = 0;
	
	
	ItemList:Clear()
-- 	itemMemSum = 0; -- debug
	for name in pairs(self.data[realm]) do
		
		-- Player filter.
		if filters.owner[name] then
			
			for bagID in pairs(self.data[realm][name]) do
				local bagType = self:GetBagType(bagID)
				
				if filters.location[bagType] == nil then
					filters.location[bagType] = true
				end
				
				-- BagType filter.
				if filters.location[bagType] then
					
					local n = table.getn(self.data[realm][name][bagID]);
				
					local index = 1;
					while index < n  do
					--for idx = 1, n, 2 do
					
						local itemCount = self.data[realm][name][bagID][index+1];
						local itemID = self.data[realm][name][bagID][index];
-- 							itemMem = gcinfo() -- debug
						local iName, iLink, iQuality, _, _, iType, sType, _, eqLoc, _ = GetItemInfo(itemID);
						
						if not iName then
							self:DebugF(2, "GetItemInfo() returned nil for %s in %s, %s", itemID, name, bagID)
						else
							if filters.type[iType] == nil then
								filters.type[iType] = true
							end
							if filters.subType[sType] == nil then
								filters.subType[sType] = true
							end
							if not itemTypes[iType] then
								itemTypes[iType] = {}
							end
							itemTypes[iType][sType] = true
							
							if filters.rarity[iQuality] and filters.type[iType] and filters.subType[sType] and filters.equipLoc[eqLoc] then
							
								-- Keyword filter.
								if not self.itemKeyword or iName:lower():find(self.itemKeyword:lower()) then
									ItemList:Add(iLink,itemCount,name,bagID)
									listSize = listSize + 1;
								end
							end
						end
						
-- 							itemMemSum = gcinfo() - itemMem + itemMemSum -- debug
							
						-- Rarity filter.
						
						index = index + 2;
						
					end	
					
					
				end
			end
		end
	end

	
	ItemList:Sort(self.currentSortKey)
	

	self.itemListSize = listSize;
	
-- 	DEFAULT_CHAT_FRAME:AddMessage(string.format("Mem: %d, ItemMem: %d, Time: %.3f", gcinfo() - mem, itemMemSum, GetTime() - timer)) -- debug
	
end

---------------------------------
-- Graphical Interface
---------------------------------


function view:ToggleFrame()
	if not self.data then
		self:Print("Data table not found.")
	else
		if not searchFrame then
			self:CreateSearchFrame():Show()
		elseif searchFrame:IsShown() then
			searchFrame:Hide()
		else
			searchFrame:Show()
		end
	end
end

-- Inject ToggleFrame() method to core.
function core:ToggleFrame()
	view:ToggleFrame()
end

function view:ToggleColumn(column)
	local newWidth
	db.profile.hideColumns[column] = not db.profile.hideColumns[column]
	if db.profile.hideColumns[column] then
		newWidth = tab:HideColumn(column) + 30
	else
		newWidth = tab:ShowColumn(column) + 30
	end
	if newWidth < 400 then
		newWidth = 400
	end
	searchFrame:SetWidth(newWidth)
end


function view:SearchItem2()
	local text = this:GetText()
	if not text then return end
	
	self.itemKeyword = text
	self:RefreshItemList()
	this:ClearFocus();
end



function view:RefreshHeaderTitle(column)
	local textTable, filterTable, title
	local count,total = 0,0
	if column == HEADER_OWNER then
		for name in pairs(self.data[realm]) do
			total = total + 1
			if filters.owner[name] then
				count = count + 1
				title = name
			end
		end
		if count == 1 then
			title = "|cffffffff"..title.."|r"
		elseif count < total then
			title = string.format("%s (%d/%d)", L["Owner"], count, total)
		else
			title = L["Owner"]
		end
		tab:SetHeaderText(HEADER_OWNER,title)
	elseif column == HEADER_RARITY then
		total = 7
		for i=0,6 do
			if filters.rarity[i] then
				count = count + 1
				title = rarityTexts[i]
			end
		end
		if count == 1 then
			-- title is already colored.
		elseif count < total then
			title = string.format("%s (%d/%d)", L["Rarity"], count, total)
		else
			title = L["Rarity"]
		end
		searchFrame.rarityText:SetText(title)
	elseif column == HEADER_LOCATION then
		for key, checked in pairs(filters.location) do
			total = total + 1
			if checked then
				count = count + 1
				title = key
			end
		end
		if count == 1 then
			title = "|cffffffff"..L[title].."|r"
		elseif count < total then
			title = string.format("%s (%d/%d)", L["Location"], count, total)
		else
			title = L["Location"]
		end
		tab:SetHeaderText(HEADER_LOCATION,title)
	elseif column == HEADER_TYPE then
		local subCount, subTotal = 0, 0
		for type, checked in pairs(filters.type) do
			total = total + 1
			if checked then
				count = count + 1
			end
		end
		for subType, checked in pairs(filters.subType) do
			subTotal = subTotal + 1
			if checked then
				subCount = subCount + 1
			end
		end
		if count < total or subCount < subTotal then
			title = string.format("%s (%d/%d - %d/%d)", L["Type"], count, total, subCount, subTotal)
		else
			title = L["Type"]
		end
		tab:SetHeaderText(HEADER_TYPE,title)
	elseif column == HEADER_EQUIPLOC then
		for type, checked in pairs(filters.equipLoc) do
			total = total + 1
			if checked then
				count = count + 1
				title = type
			end
		end
		if count == 1 then
			title = "|cffffffff"..L[title].."|r"
		elseif count < total then
			title = string.format("%s (%d/%d)", L["Equip Loc"], count, total)
		else
			title = L["Equip Loc"]
		end
		tab:SetHeaderText(HEADER_EQUIPLOC,title)
	elseif not column then
		tab:SetHeaderText(HEADER_OWNER,L["Owner"])
		searchFrame.rarityText:SetText(L["Rarity"])
		tab:SetHeaderText(HEADER_LOCATION,L["Location"])
		tab:SetHeaderText(HEADER_TYPE,L["Type"])
		tab:SetHeaderText(HEADER_EQUIPLOC,L["Equip Loc"])
	end

end

function view:RefreshItemList(nobuild)
	if not nobuild then
		self:BuildIndex()
	end
	tab:SetDataSize(ItemList:GetSize())
	self:OnValueChange(0)
end

function view:OnValueChange(offset)
	for i=1, SCROLL_LIST_SIZE do
		local idx = offset + i
		local rowFrame = tab:GetRowFrame(i)
		if idx <= ItemList:GetSize() then
			local itemLink,itemCount,playerName,bagID = ItemList:Get(idx)
			local itemName, _, itemRarity, _, _, itemType, itemSubType, _, itemEquipLoc, itemTexture = GetItemInfo(itemLink)
			if itemLink then
				rowFrame.itemLink = itemLink
				local locationText = L[self:GetBagType(bagID)]
				local typeText
				self.itemIcons[i]:SetTexture(itemTexture)
				if itemName then
					itemName = ITEM_QUALITY_COLORS[itemRarity].hex .. itemName .. "|r"
					typeText = string.format("%s - %s", itemType, itemSubType)
				else
					itemName = itemLink
					textText = ""
				end
				tab:FillRowData(i, itemName, itemCount, playerName, locationText, typeText, L[itemEquipLoc])
			end
		else
			tab:HideRow(i)
		end
	end
end

function controllers.OnEnterRow(frame)
	if frame.itemLink then
		GameTooltip:SetOwner(frame, "ANCHOR_RIGHT");
		GameTooltip:SetHyperlink(frame.itemLink);
	end
end

function controllers.OnLeaveRow(frame)
	if(GameTooltip:IsVisible()) then GameTooltip:Hide(); end 
end

function controllers.OnClickRow(frame)
	if frame.itemLink then
		if IsShiftKeyDown() then
			ChatEdit_InsertLink(frame.itemLink)
		elseif IsControlKeyDown() then
			DressUpItemLink(frame.itemLink)
		end
	end
end

local columnIndexMap = {
	"Item Name",
	"Quantity",
	"Owner",
	"Location",
	"Type",
	"Equip Loc",
}
function controllers.onClickColumnSelect(frame,arg1)
	if arg1 == "LeftButton" then
		controllers.onLeftClickColumnSelect(frame)
	elseif arg1 == "RightButton" then
		controllers.onRightClickColumnSelect(frame)
	end
end

function controllers.onRightClickColumnSelect(frame)
	if IsAltKeyDown() then
		ResetFilters()
		view:RefreshHeaderTitle()
		view:RefreshItemList()
	end
end

-- A map from search frame header column index to sorter index.
local columnToSortMap = {
	[HEADER_RARITY] = 5,
	[HEADER_ITEM] = 1,
	[HEADER_QUANTITY] = 2,
	[HEADER_OWNER] = 3,
	[HEADER_LOCATION] = 4,
	[HEADER_TYPE] = 6,
	[HEADER_EQUIPLOC] = 8,
}
function controllers.onClickHeaderButton(frame,column)
	local sortKey = columnToSortMap[column]
	if sortKey then
		if sortKey == view.currentSortKey then
			sortKey = -sortKey
		end
		view.currentSortKey = sortKey
		ItemList:Sort(sortKey)
		view:RefreshItemList(true)
	end
end

---------------------------
-- Drop Down Menu 
---------------------------

local DropDownFunc
local dropdownfunc = {}

if dewdrop then

	DropDownFunc = function(filter,value)
		if IsAltKeyDown() then
			ToggleFilter(filter,value,true,true)
		else
			ToggleFilter(filter,value)
		end
	end
	
	controllers.onRightClickHeaderButton = function(frame,column)
		if dropdownfunc[column] then
			if dewdrop:IsOpen(frame) then
				dewdrop:Close()
			else
				dewdrop:Open(frame,
					'children', dropdownfunc[column],
					'point', 'TOPLEFT',
					'relativePoint', 'BOTTOMLEFT'
				)
			end
		end
	end

	controllers.onLeftClickColumnSelect = function(frame)
		if dewdrop:IsOpen(frame) then
			dewdrop:Close()
		else
			dewdrop:Open(frame,
				'children', dropdownfunc.columnSelection,
				'point', 'TOPLEFT',
				'relativePoint', 'BOTTOMLEFT'
			)
		end
	end
	
	dropdownfunc[HEADER_RARITY] = function(level)
		if level ==1  then
			if not rarityTexts then
				rarityTexts = {}
				for i, text in ipairs({"Poor","Normal","Good","Rare","Epic","Legendary","Artifact"}) do
					rarityTexts[i-1] = ITEM_QUALITY_COLORS[i-1].hex .. L[text] .. "|r"
				end
			end
			
			for i=0, 6, 1 do
				local text = rarityTexts[i]
				dewdrop:AddLine(
					'text', text,
					'func', DropDownFunc,
					'arg1', 'rarity',
					'arg2', i,
					'checked', filters.rarity[i],
					'tooltipTitle', L["Rarity"],
					'tooltipText', L["Alt-Left-Click to select only that item."]
				)
			end
		end
		
	end
	
	dropdownfunc[HEADER_OWNER] = function(level)
		if level == 1 then
			local info
			for name in pairs(view.data[realm]) do
				dewdrop:AddLine(
					'text', name,
					'func', DropDownFunc,
					'arg1', 'owner',
					'arg2', name,
					'checked', filters.owner[name],
					'tooltipTitle', L["Rarity"],
					'tooltipText', L["Alt-Left-Click to select only that item."]
				)
			end
		end
	end

	dropdownfunc[HEADER_LOCATION] = function(level)
		if level == 1 then
			for bagType in pairs(filters.location) do
				dewdrop:AddLine(
					'text', L[bagType],
					'func', DropDownFunc,
					'arg1', 'location',
					'arg2', bagType,
					'checked', filters.location[bagType],
					'tooltipTitle', L["Location"],
					'tooltipText', L["Alt-Left-Click to select only that item."]
				)
			end
		end
	end

	dropdownfunc[HEADER_TYPE] = function(level,value)
		if level == 1 then
			if not next(itemTypes) then
				dewdrop:AddLine(
					'text', L["No Type Available"],
					'tooltipTitle', L["No Type Available"],
					'tooltipText', L["The item type list will be built after you do an initial search."],
					'notCheckable', true
				)
			else
				for itemType in pairs(itemTypes) do
					local checked = filters.type[itemType]
					dewdrop:AddLine(
						'text', itemType,
						'func', DropDownFunc,
						'arg1', 'type',
						'arg2', itemType,
						'checked', checked,
						'tooltipTitle', L["Type"],
						'tooltipText', L["Alt-Left-Click to select only that item."],
						'hasArrow', checked,
						'value', itemType
					)
				end
			end
		elseif level == 2 then
			local itemType = value
			for itemSubType in pairs(itemTypes[itemType]) do
				local checked = filters.subType[itemSubType]
				dewdrop:AddLine(
					'text', itemSubType,
					'func', DropDownFunc,
					'arg1', 'subType',
					'arg2', itemSubType,
					'checked', checked,
					'tooltipTitle', L["Sub Type"],
					'tooltipText', L["Alt-Left-Click to select only that item."]
				)
			end
		end
	end

	dropdownfunc[HEADER_EQUIPLOC] = function(level)
		if level == 1 then
			for itemEquipLoc in pairs(filters.equipLoc) do
				dewdrop:AddLine(
					'text', L[itemEquipLoc],
					'func', DropDownFunc,
					'arg1', 'equipLoc',
					'arg2', itemEquipLoc,
					'checked', filters.equipLoc[itemEquipLoc],
					'tooltipTitle', L["Equip Loc"],
					'tooltipText', L["Alt-Left-Click to select only that item."]
				)
			end
		end
	end

	dropdownfunc.columnSelection = function(level)
		if level == 1 then
			for i, columnName in ipairs(columnIndexMap) do
				local isShown = tab:IsColumnShown(i)
				dewdrop:AddLine(
					'text', L[columnName],
					'func', view.ToggleColumn,
					'arg1', view,
					'arg2', i,
					'checked', isShown
				)
			end
		end
	end
	
else

	DropDownFunc = function(filter,value)
		if IsAltKeyDown() then
			ToggleFilter(filter,value,true,true)
			CloseDropDownMenus()
		else
			ToggleFilter(filter,value)
		end
	end

	controllers.onRightClickHeaderButton = function(frame,column)
		if dropdownfunc[column] then
			if not frame.dropdown then
				frame.dropdown = CreateFrame("Frame", "SimpleBankStateDropDown"..column, nil, "UIDropDownMenuTemplate")
				UIDropDownMenu_Initialize(frame.dropdown, dropdownfunc[column], "MENU")
				UIDropDownMenu_SetAnchor(0, 0, frame.dropdown, "TOPLEFT", frame, "BOTTOMLEFT")
			end
			ToggleDropDownMenu(1, nil, frame.dropdown)
		end
	end
	
	controllers.onLeftClickColumnSelect = function(frame)
		if not frame.dropdown then
			frame.dropdown = CreateFrame("Frame", "SimpleBankStateColumnDropDown", nil, "UIDropDownMenuTemplate")
			UIDropDownMenu_Initialize(frame.dropdown, dropdownfunc.columnSelection, "MENU")
			UIDropDownMenu_SetAnchor(0, 0, frame.dropdown, "TOPLEFT", frame, "BOTTOMLEFT")
		end
		ToggleDropDownMenu(1, nil, frame.dropdown)
	end

	dropdownfunc[HEADER_RARITY] = function(level)
		if level ==1  then
			local info
			if not rarityTexts then
				rarityTexts = {}
				for i, text in ipairs({"Poor","Normal","Good","Rare","Epic","Legendary","Artifact"}) do
					rarityTexts[i-1] = ITEM_QUALITY_COLORS[i-1].hex .. L[text] .. "|r"
				end
			end
			
			for i=0, 6, 1 do
				local text = rarityTexts[i]
				info = UIDropDownMenu_CreateInfo()
				info.text = text
				info.func = DropDownFunc
				info.arg1 = 'rarity'
				info.arg2 = i
				info.checked = filters.rarity[i]
				info.tooltipTitle = L["Rarity"]
				info.tooltipText = L["Alt-Left-Click to select only that item."]
				info.keepShownOnClick = 1
				UIDropDownMenu_AddButton(info)
			end
		end
		
	end

	dropdownfunc[HEADER_OWNER] = function(level)
		if level == 1 then
			local info
			for name in pairs(view.data[realm]) do
				info = UIDropDownMenu_CreateInfo()
				info.text = name
				info.func = DropDownFunc
				info.arg1 = 'owner'
				info.arg2 = name
				info.checked = filters.owner[name]
				info.tooltipTitle = L["Owner"]
				info.tooltipText = L["Alt-Left-Click to select only that item."]
				info.keepShownOnClick = 1
				UIDropDownMenu_AddButton(info)
			end
		end
	end

	dropdownfunc[HEADER_LOCATION] = function(level)
		if level == 1 then
			local info
			for bagType in pairs(filters.location) do
				info = UIDropDownMenu_CreateInfo()
				info.text = L[bagType]
				info.func = DropDownFunc
				info.arg1 = 'location'
				info.arg2 = bagType
				info.checked = filters.location[bagType]
				info.tooltipTitle = L["Location"]
				info.tooltipText = L["Alt-Left-Click to select only that item."]
				info.keepShownOnClick = 1
				UIDropDownMenu_AddButton(info)
			end
		end
	end

	dropdownfunc[HEADER_TYPE] = function(level)
		local info, checked
		if level == 1 then
			if not next(itemTypes) then
					info = UIDropDownMenu_CreateInfo()
					info.text = L["No Type Available"]
					info.tooltipTitle = L["No Type Available"]
					info.tooltipText = L["The item type list will be built after you do an initial search."]
					info.notCheckable = 1
					UIDropDownMenu_AddButton(info,level)
			else
				for itemType in pairs(itemTypes) do
					checked = filters.type[itemType]
					info = UIDropDownMenu_CreateInfo()
					info.text = itemType
					info.func = DropDownFunc
					info.arg1 = 'type'
					info.arg2 = itemType
					info.checked = checked
					info.tooltipTitle = L["Type"]
					info.tooltipText = L["Alt-Left-Click to select only that item."]
					info.keepShownOnClick = 1
					info.hasArrow = true
					info.value = itemType
					UIDropDownMenu_AddButton(info,level)
				end
			end
		elseif level == 2 then
			local itemType = UIDROPDOWNMENU_MENU_VALUE
			for itemSubType in pairs(itemTypes[itemType]) do
				checked = filters.subType[itemSubType]
				info = UIDropDownMenu_CreateInfo()
				info.text = itemSubType
				info.func = DropDownFunc
				info.arg1 = 'subType'
				info.arg2 = itemSubType
				info.checked = checked
					info.tooltipTitle = L["Sub Type"]
					info.tooltipText = L["Alt-Left-Click to select only that item."]
				info.keepShownOnClick = 1
				UIDropDownMenu_AddButton(info,level)
			end
		end
	end

	dropdownfunc[HEADER_EQUIPLOC] = function(level)
		if level == 1 then
			local info
			for itemEquipLoc in pairs(filters.equipLoc) do
				info = UIDropDownMenu_CreateInfo()
				info.text = L[itemEquipLoc]
				info.func = DropDownFunc
				info.arg1 = 'equipLoc'
				info.arg2 = itemEquipLoc
				info.checked = filters.equipLoc[itemEquipLoc]
				info.tooltipTitle = L["Equip Loc"]
				info.tooltipText = L["Alt-Left-Click to select only that item."]
				info.keepShownOnClick = 1
				UIDropDownMenu_AddButton(info)
			end
		end
	end

	dropdownfunc.columnSelection = function(level)
		local info
		if level == 1 then
			for i, columnName in ipairs(columnIndexMap) do
				local isShown = tab:IsColumnShown(i)
				info = UIDropDownMenu_CreateInfo()
				info.text = L[columnName]
				info.func = view.ToggleColumn
				info.arg1 = view
				info.arg2 = i
				info.keepShownOnClick = 1
				info.checked = isShown
				UIDropDownMenu_AddButton(info)
			end
		end
	end

end


