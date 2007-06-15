--local dewdrop = AceLibrary("Dewdrop-2.0")


SimpleBankState = DongleStub("Dongle-1.1"):New("SimpleUnitFramesView")

local function recycle(t)
	for k in pairs(t) do
		t[k] = nil
	end
	return t
end
--
local SCROLL_LIST_SIZE = 20
local ITEM_LINK_WIDTH = 200
local ITEM_COUNT_WIDTH = 30
local ITEM_OWNER_WIDTH = 100
local ITEM_BAG_ID_WIDTH = 60
local ITEM_TYPE_WIDTH = 100
local ITEM_SUBTYPE_WIDTH = 100
local ITEM_EQUIP_LOC_WIDTH = 100
local ROW_HEIGHT = 20

-- Constants
local EQUIP_ID = 100 -- Index of equipment in saved variables.
local MAIL_ID = 101

--local globals
local me = UnitName("player"); --the name of the current player that's logged on
local realm = GetRealmName(); --what realm we're on

local tab
local searchFrame
local controllers = {}
local rarityTexts
local L = {}
local itemTypes = {}


local function Colorize(text, hex)
	return "|cff"..hex..text.."|r"
end

local function GetReturn(index, ...)
	return select(index, ...)
end


function SimpleBankState:Enable()
	
	self.data = SBS_Data

end


function SimpleBankState:CreateSearchFrame()
	if not searchFrame then
		
		self.itemIcons = {}
		self.itemEquipLoc = {}
		
		-- Create the main frame.
		searchFrame = CreateFrame("Frame", "SimpleBankStateSearchFrame")
		searchFrame:SetWidth(485)
		searchFrame:SetHeight(485)
		searchFrame:SetPoint("CENTER")
		searchFrame:SetBackdrop({
			bgFile="Interface/DialogFrame/UI-DialogBox-Background",
			edgeFile="Interface/DialogFrame/UI-DialogBox-Border",
			tile=true,
			tileSize=32,
			edgeSize=32,
			insets = { left=11, right=12, top=12, bottom=11 },
		})
		
		local frame, fontString, texture
		-- Header frame.
		frame = CreateFrame("Frame", nil, searchFrame, "OptionFrameBoxTemplate")
		searchFrame.headerFrame = frame
		frame:SetWidth(365)
		frame:SetHeight(30)
		frame:SetPoint("BOTTOM", searchFrame, "TOP", 0, -5)
		frame:SetBackdropColor(0.4, 0.4, 0.4)
		fontString = frame:CreateFontString(nil, "BACKGROUND", "GameFontNormal")
		fontString:SetPoint("CENTER")
		fontString:SetText("SimpleBankState")
		
		-- Close Button.
		frame = CreateFrame("Button", nil, searchFrame, "UIPanelCloseButton")
		searchFrame.closeButton = frame
		--frame:SetTopLevel(true)
		frame:SetPoint("CENTER", searchFrame.headerFrame, "RIGHT", -17, 0)
		
		-- Column List Button
		frame = CreateFrame("Button", nil, searchFrame, "UIPanelButtonTemplate")
		frame:SetPoint("BOTTOMLEFT", searchFrame, "BOTTOMLEFT", 14, 13)
		frame:SetWidth(50)
		frame:SetHeight(24)
		frame:SetText("Show")
		frame:SetScript("OnClick", controllers.onClickColumnSelect)
		
		-- Search Box.
		frame = CreateFrame("EditBox", nil, searchFrame, "InputBoxTemplate")
		searchFrame.editBox = frame
		frame:SetAutoFocus(false)
		frame:ClearFocus()
		frame:SetMaxLetters(256)
		frame:SetWidth(180)
		frame:SetHeight(20)
		frame:SetPoint("BOTTOMLEFT", searchFrame, "BOTTOMLEFT", 90, 14)
		frame:SetScript("OnEscapePressed", function(this) this:ClearFocus() end )
		frame:SetScript("OnEnterPressed", function(this) SimpleBankState:SearchItem2() end )
		
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
		'columns', 7,
		'slider', slider,
		'header1text', L["Item Name"],
		'header2text', L["Quantity"],
		'header3text', L["Owner"],
		'header4text', L["Location"],
		'header5text', L["Type"],
		'header6text', L["Sub Type"],
		'header7text', L["Equip Loc"],
		'columnWidth1', ITEM_LINK_WIDTH,
		'columnWidth2', ITEM_COUNT_WIDTH,
		'columnWidth3', ITEM_OWNER_WIDTH,
		'columnWidth4', ITEM_BAG_ID_WIDTH,
		'columnWidth5', ITEM_TYPE_WIDTH,
		'columnWidth6', ITEM_SUBTYPE_WIDTH,
		'columnWidth7', ITEM_EQUIP_LOC_WIDTH,
		'rowHeight', ROW_HEIGHT,
		'onClickRow', self.OnClickRow,
		'onEnterRow', self.OnMouseOver,
		'onLeaveRow', self.OnLeaveRow,
		'onInitHeader', function(column, button, fontString)
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

		--[[
		,'backdrop', {
			bgFile="Interface\\Tooltips\\UI-Tooltip-Background",
			edgeFile="Interface\\Tooltips\\UI-Tooltip-Border",
			tile=true,
			tileSize=16,
			edgeSize=16,
			insets = { left=5, right=4, top=5, bottom=5 },
		},
		'backdropColorR', 0.3,
		'backdropColorG', 0.3,
		'backdropColorB', 0.3
		]]
		)

		tab:SetValueChangeFunction( function(offset) SimpleBankState:OnValueChange(offset) end )
		

		-- Rarity Header.
		frame = CreateFrame("Button", nil, tab:GetHeaderButton(1))
		frame:SetWidth(50)
		frame:SetHeight(20)
		frame:SetPoint("TOPLEFT", tab:GetHeaderButton(1), "TOPLEFT", 120, 0)
		frame.text = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
		frame.text:SetPoint("CENTER")
		frame.text:SetText(L["Rarity"])
		frame:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		frame:SetScript("OnClick", function(button, arg1)
			if arg1 == "LeftButton" then
				controllers.onClickHeaderButton(this,0)
			elseif arg1 == "RightButton" then
				controllers.onRightClickHeaderButton(this,0)
			end
		end)
		searchFrame.rarityText = frame.text
		
		frame = tab:GetFrame()
		searchFrame:SetHeight(frame:GetHeight()+ 30 + searchFrame.editBox:GetHeight())
		searchFrame:SetWidth(frame:GetWidth()+ 30 + ROW_HEIGHT )
		frame:SetParent(searchFrame)
		frame:SetPoint("TOPLEFT", searchFrame, "TOPLEFT", 18 + ROW_HEIGHT, -12)
		frame:SetPoint("BOTTOMRIGHT", searchFrame, "BOTTOMRIGHT", -12, 42 )
		frame:Show()

		self.tab = tab

		table.insert(UISpecialFrames, "SimpleBankStateSearchFrame")
	end
	return searchFrame
end

function SimpleBankState:OnRightClickHeaderButton(column)
	local newWidth = self.tab:HideColumn(column)
	searchFrame:SetWidth(newWidth+24)
end






function SimpleBankState:UpdateVersion()
	self.data.version = self.version;
end


--------------------------
-- Data Recording
--------------------------




function SimpleBankState:IsBankBag(bagID)
	if bagID == BANK_CONTAINER or ( bagID >= 5 and bagID <= 10 ) then
		return true
	end
end


function SimpleBankState:GetBagType(bagID)
	if bagID == EQUIP_ID then
		return "EQUIPMENT";
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
	position = asc, negative = desc
]]
	local sorter = {
		[1] = function(a,b) return GetItemInfo(ItemList[a]) < GetItemInfo(ItemList[b]) end,
		[2] = function(a,b) return ItemList[a+1] < ItemList[b+1] end,
		[3] = function(a,b) return ItemList[a+2] < ItemList[b+2] end,
		[4] = function(a,b) return ItemList[a+3] < ItemList[b+3] end,
		[5] = function(a,b) return GetReturn(3, GetItemInfo(ItemList[a])) < GetReturn(3, GetItemInfo(ItemList[b])) end,
		[6] = function(a,b) return GetReturn(6, GetItemInfo(ItemList[a])) < GetReturn(6, GetItemInfo(ItemList[b])) end,
		[7] = function(a,b) return GetReturn(7, GetItemInfo(ItemList[a])) < GetReturn(7, GetItemInfo(ItemList[b])) end,
		[8] = function(a,b) return GetReturn(9, GetItemInfo(ItemList[a])) < GetReturn(9, GetItemInfo(ItemList[b])) end,
		[-1] = function(a,b) return GetItemInfo(ItemList[a]) > GetItemInfo(ItemList[b]) end,
		[-2] = function(a,b) return ItemList[a+1] > ItemList[b+1] end,
		[-3] = function(a,b) return ItemList[a+2] > ItemList[b+2] end,
		[-4] = function(a,b) return ItemList[a+3] > ItemList[b+3] end,
		[-5] = function(a,b) return GetReturn(3, GetItemInfo(ItemList[a])) > GetReturn(3, GetItemInfo(ItemList[b])) end,
		[-6] = function(a,b) return GetReturn(6, GetItemInfo(ItemList[a])) > GetReturn(6, GetItemInfo(ItemList[b])) end,
		[-7] = function(a,b) return GetReturn(7, GetItemInfo(ItemList[a])) > GetReturn(7, GetItemInfo(ItemList[b])) end,
		[-8] = function(a,b) return GetReturn(9, GetItemInfo(ItemList[a])) > GetReturn(9, GetItemInfo(ItemList[b])) end,
	}
	function ItemList:GetSize()
		return #indexMap
	end
	function ItemList:Sort(key)
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

local filters = {}
local function SetFilter(filter,value)
	
	if filters[filter] == value then
		filters[filter] = nil
	else
		filters[filter] = value
	end
	
	SimpleBankState:RefreshHeaderTitles()
	SimpleBankState:BuildIndex()
	SimpleBankState:OnValueChange(0)
	
end

function SimpleBankState:BuildIndex()

-- 	local itemMem, itemMemSum -- debug
-- 	local mem = gcinfo() -- debug
-- 	local timer = GetTime() -- debug
		
	local itemInfo, itemName, itemLink, itemQuality, itemCount;
	
	local listSize = 0;
	
	
	ItemList:Clear()
-- 	itemMemSum = 0; -- debug
	for name in pairs(self.data[realm]) do
		
		-- Player filter.
		if not filters.owner or filters.owner == name then
		
			for bagID in pairs(self.data[realm][name]) do
				local bagType = self:GetBagType(bagID);
				
				-- BagType filter.
				if not filters.bagType or filters.bagType == bagType then

					local n = table.getn(self.data[realm][name][bagID]);
				
					local index = 1;
					while index < n  do
					--for idx = 1, n, 2 do
					
						itemCount = self.data[realm][name][bagID][index+1];
						itemID = self.data[realm][name][bagID][index];
-- 							itemMem = gcinfo() -- debug
						iName, iLink, iQuality, _, _, iType, sType, _, eqLoc, _ = GetItemInfo(itemID);
						
						if not iName then
							self:PrintF("GetItemInfo() returned nil for %s in %s, %s", itemID, name, bagID)
						else
							if not itemTypes[iType] then
								itemTypes[iType] = {}
							end
							itemTypes[iType][sType] = true
							self.itemEquipLoc[eqLoc] = true
							
							if not filters.rarity or filters.rarity == iQuality then
								if not filters.itemType or filters.itemType == iType then
									if not filters.itemSubType or filters.itemSubType == sType then
										if not filters.itemEquipLoc or filters.itemEquipLoc == eqLoc then
							
											-- Keyword filter.
											if not self.itemKeyword or iName:lower():find(self.itemKeyword:lower()) then
												ItemList:Add(iLink,itemCount,name,bagID)
												listSize = listSize + 1;
											end
										end
									end
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


-- sortKey: 1=itemName, 2=itemLink, 3=itemCount, 4=itemQuality, 5=charName, 6=bagType.
function SimpleBankState:SortItems(sortKey)

	ItemList:Sort(1)

end

---------------------------------
-- Graphical Interface
---------------------------------


function SimpleBankState:ToggleFrame()
	if not searchFrame then
		self:CreateSearchFrame():Show()
	elseif searchFrame:IsShown() then
		searchFrame:Hide()
	else
		searchFrame:Show()
	end
end

function SimpleBankState:ToggleColumn(column)
	local newWidth
	if tab:IsColumnShown(column) then
		newWidth = tab:HideColumn(column) + 24
	else
		newWidth = tab:ShowColumn(column) + 24
	end
	if newWidth < 400 then
		newWidth = 400
	end
	searchFrame:SetWidth(newWidth)
end

function SimpleBankState:ItemEnter()
	if this.itemLink then
		GameTooltip:SetOwner(this, "ANCHOR_RIGHT");
		GameTooltip:SetHyperlink(this.itemLink);
	end
end

function SimpleBankState:Refresh_OnClick()
	self:BuildIndex();
	self:UpdateScrollFrame();
	tab:SetDataSize(self.itemListSize or 0)
end

function SimpleBankState:SearchItem2()
	local text = this:GetText()
	if not text then return end
	
	self.itemKeyword = text
	self:BuildIndex()
	tab:SetDataSize(self.itemListSize or 0)
	self:OnValueChange(0)
	this:ClearFocus();
end

function SimpleBankState:SearchItem()
	local text = this:GetText()
	if not text then return end
	
	self.itemKeyword = text
	self:BuildIndex()
	self:UpdateScrollFrame();
	this:ClearFocus();
end


function SimpleBankState.PlayerDropDown()
	local self = SimpleBankState
	for name in pairs(self.data[realm]) do
		dewdrop:AddLine(
			'text', name,
			'func', self.SetFilter,
			'arg1', self,
			'arg2', 'player',
			'arg3', name,
			'closeWhenClicked', true
		)
	end
end

function SimpleBankState:UpdateLocales(loc)
	for k, v in pairs(loc) do
		if v == true then
			L[k] = k
		else
			L[k] = v
		end
	end
end

function SimpleBankState.BagTypeDropDown()
	local self = SimpleBankState
	if not self.bagTypes then
		self.bagTypes = {
			"BAG",
			"BANK",
			"EQUIPMENT",
			"MAIL",
		}
	end
	for i, bagType in pairs(self.bagTypes) do
		dewdrop:AddLine(
			'text', self.loc[bagType],
			'func', self.SetFilter,
			'arg1', self,
			'arg2', 'bagType',
			'arg3', bagType,
			'closeWhenClicked', true
		)
	end
end

function SimpleBankState:SetFilter(field, value)

	if filters[field] == value then 
		filters[field] = nil
	else
		filters[field] = value;
	end

	self:UpdateFrameTitle();
	
	if self.itemList then
		self:BuildIndex()
		self:UpdateScrollFrame();
	end

	
end



function SimpleBankState:RefreshHeaderTitles()

	if filters.owner then
		tab:SetHeaderText(3,Colorize(filters.owner, "FFFFFF"))
	else
		tab:SetHeaderText(3,"Owner")
	end
	
	if filters.bagType then
	end
	
	if filters.rarity then
		searchFrame.rarityText:SetText(rarityTexts[filters.rarity])
	else
		searchFrame.rarityText:SetText("Rarity")
	end

end


function SimpleBankState:OnValueChange(offset)
	for i=1, SCROLL_LIST_SIZE do
		local idx = offset + i
		local rowFrame = tab:GetRowFrame(i)
		if idx <= ItemList:GetSize() then
			local itemLink,itemCount,playerName,bagID = ItemList:Get(idx)
			local _, _, _, _, _, itemType, itemSubType, _, itemEquipLoc, itemTexture = GetItemInfo(itemLink)
			if itemLink then
				tab:FillRowData(i, itemLink, itemCount, playerName, bagID, itemType, itemSubType, L[itemEquipLoc])
				rowFrame.itemLink = itemLink
				self.itemIcons[i]:SetTexture(itemTexture)
			end
		else
			tab:HideRow(i)
		end
	end
end

function SimpleBankState.OnMouseOver(frame)
	if frame.itemLink then
		GameTooltip:SetOwner(frame, "ANCHOR_RIGHT");
		GameTooltip:SetHyperlink(frame.itemLink);
	end
end

function SimpleBankState.OnLeaveRow(frame)
	if(GameTooltip:IsVisible()) then GameTooltip:Hide(); end 
end

function SimpleBankState.OnClickRow(frame)
	if frame.itemLink then
		ChatEdit_InsertLink(frame.itemLink)
	end
end

local columnIndexMap = {
	"Item Link",
	"Count",
	"Owner",
	"BagID",
	"Type",
	"SubType",
	"EquipLoc",
}
function SimpleBankState:PopulateColumnSelection(level)
	local info
	if level == 1 then
		for i, columnName in ipairs(columnIndexMap) do
			local isShown = tab:IsColumnShown(i)
			info = UIDropDownMenu_CreateInfo()
			info.text = columnName
			info.func = self.ToggleColumn
			info.arg1 = self
			info.arg2 = i
			info.keepShownOnClick = 1
			info.checked = isShown
			UIDropDownMenu_AddButton(info)
		end
	end
end

SimpleBankState.dropdownfunc = setmetatable({}, { __index = function(t,k) return function() end end })


SimpleBankState.dropdownfunc[0] = function(self,level)
	local info

	if not rarityTexts then
		rarityTexts = {}
		for i, rarity in ipairs({"POOR","NORMAL","GOOD","RARE","EPIC","LEGENDARY","ARTIFACT"}) do
			rarityTexts[i-1] = ITEM_QUALITY_COLORS[i-1].hex .. rarity .. "|r"
		end
	end
	
	for i=0, 6, 1 do
		local text = rarityTexts[i]
		info = UIDropDownMenu_CreateInfo()
		info.text = text
		info.func = SetFilter
		info.arg1 = 'rarity'
		info.arg2 = i
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info)
	end
	
end

SimpleBankState.dropdownfunc[3] = function(self,level)
	local info
	for name in pairs(self.data[realm]) do
		info = UIDropDownMenu_CreateInfo()
		info.text = name
		info.func = SetFilter
		info.arg1 = 'owner'
		info.arg2 = name
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info)
	end
end

SimpleBankState.dropdownfunc[5] = function(self,level)
	local info
	for itemType in pairs(itemTypes) do
		info = UIDropDownMenu_CreateInfo()
		info.text = itemType
		info.func = SetFilter
		info.arg1 = 'itemType'
		info.arg2 = itemType
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info)
	end
end

SimpleBankState.dropdownfunc[6] = function(self,level)
	if not filters.itemType then 
		self:Print("Select a main type first.")
	else
		local info
		for itemSubType in pairs(itemTypes[filters.itemType]) do
			info = UIDropDownMenu_CreateInfo()
			info.text = itemSubType
			info.func = SetFilter
			info.arg1 = 'itemSubType'
			info.arg2 = itemSubType
			info.notCheckable = 1
			UIDropDownMenu_AddButton(info)
		end
	end
end

SimpleBankState.dropdownfunc[7] = function(self,level)
	local info
	for itemEquipLoc in pairs(self.itemEquipLoc) do
		info = UIDropDownMenu_CreateInfo()
		info.text = L[itemEquipLoc]
		info.func = SetFilter
		info.arg1 = 'itemEquipLoc'
		info.arg2 = itemEquipLoc
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info)
	end
end

function controllers.onClickColumnSelect(frame)
	if not frame.dropdown then
		frame.dropdown = CreateFrame("Frame", "SimpleUnitFramesDropDown", nil, "UIDropDownMenuTemplate")
		UIDropDownMenu_Initialize(frame.dropdown, function(level) SimpleBankState:PopulateColumnSelection(level) end, "MENU")
		UIDropDownMenu_SetAnchor(0, 0, frame.dropdown, "BOTTOMLEFT", frame, "TOPLEFT")
	end
	ToggleDropDownMenu(1, nil, frame.dropdown)
end


-- A map from search frame header column index to sorter index.
local columnToSortMap = {
	[0] = 5,
	[1] = 1,
	[2] = 2,
	[3] = 3,
	[4] = 4,
	[5] = 6,
	[6] = 7,
	[7] = 8,
}
function controllers.onClickHeaderButton(frame,column)
	local sortKey = columnToSortMap[column]
	if sortKey then
		if sortKey == SimpleBankState.currentSortKey then
			sortKey = -sortKey
		end
		SimpleBankState.currentSortKey = sortKey
		ItemList:Sort(sortKey)
		SimpleBankState:OnValueChange(0)
	end
end
function controllers.onRightClickHeaderButton(frame,column)
	if not frame.dropdown then
		frame.dropdown = CreateFrame("Frame", "SimpleUnitFramesDropDown", nil, "UIDropDownMenuTemplate")
		UIDropDownMenu_Initialize(frame.dropdown, function(level)
			if level == 1 then
				SimpleBankState.dropdownfunc[column](SimpleBankState,level)
			end
		end, "MENU")
		UIDropDownMenu_SetAnchor(0, 0, frame.dropdown, "TOPLEFT", frame, "BOTTOMLEFT")
	end
	ToggleDropDownMenu(1, nil, frame.dropdown)
end


