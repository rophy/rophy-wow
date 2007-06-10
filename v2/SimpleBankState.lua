local dewdrop = AceLibrary("Dewdrop-2.0")


-- Mini-Compost --
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
local function recycle(t)
	for k in pairs(t) do
		t[k] = nil
	end
	return t
end


local UPDATE_DELAY = 2
local ITEM_LIST_FIELD_SIZE = 4

SimpleBankState = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceDebug-2.0", "AceConsole-2.0")


-- SimpleBankState.debug = true;

-- Constants
local EQUIP_ID = 100 -- Index of equipment in saved variables.
local MAIL_ID = 101

--local globals
local me = UnitName("player"); --the name of the current player that's logged on
local realm = GetRealmName(); --what realm we're on
local atBank; --is the current player at the bank or not


local tab
local searchFrame
local itemIndexMap = {}
local itemList = {}
SimpleBankState.itemList = itemList
function SimpleBankState:OnInitialize()
	
	-- Create the main frame.
	searchFrame = CreateFrame("Frame")
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
	
	-- Rarity Header.
	frame = CreateFrame("Button", nil, searchFrame)
	frame:SetWidth(50)
	frame:SetHeight(20)
	frame:SetPoint("TOPLEFT", searchFrame, "TOPLEFT", 90, -12)
	frame:SetTextFontObject("GameFontNormal")
	frame:SetText("Rarity")
	dewdrop:Register(frame, 
		'children',  SimpleBankState.RarityDropDown,
		'point', "TOPLEFT",
		'relativePoint', "BOTTOMLEFT"
	)


	
	-- Search Box.
	frame = CreateFrame("EditBox", nil, searchFrame)
	searchFrame.editBox = frame
	frame:SetFontObject("ChatFontNormal")
	frame:SetAutoFocus(false)
	frame:ClearFocus()
	frame:SetMaxLetters(256)
	frame:SetWidth(180)
	frame:SetHeight(20)
	frame:SetPoint("BOTTOMLEFT", searchFrame, "BOTTOMLEFT", 90, 14)
	frame:SetScript("OnEscapePressed", function(this) this:ClearFocus() end )
	frame:SetScript("OnEnterPressed", function(this) SimpleBankState:SearchItem2() end )
	texture = frame:CreateTexture(nil, "BACKGROUND")
	frame.textureLeft = texture
	texture:SetTexture("Interface\\Common\\Common-Input-Border")
	texture:SetWidth(8)
	texture:SetHeight(20)
	texture:SetPoint("TOPLEFT", frame, "TOPLEFT", -11, 2)
	texture:SetTexCoord(0, 0.0625, 0, 0.625)
	texture = frame:CreateTexture(nil, "BACKGROUND")
	frame.textureMiddle = texture
	texture:SetTexture("Interface\\Common\\Common-Input-Border")
	texture:SetWidth(195)
	texture:SetHeight(20)
	texture:SetPoint("LEFT", frame.textureLeft, "RIGHT")
	texture:SetTexCoord(0.0625, 0.9375, 0, 0.625)
	texture = frame:CreateTexture(nil, "BACKGROUND")
	frame.textureRight = texture
	texture:SetTexture("Interface\\Common\\Common-Input-Border")
	texture:SetWidth(8)
	texture:SetHeight(20)
	texture:SetPoint("LEFT", frame.textureMiddle, "RIGHT")
	texture:SetTexCoord(0.0625, 0.9375, 0, 0.625)
	
	tab = DongleStub("Tabulous-1.0"):Create(
	'rows', 15,
	'columns', 7,
	'header1text', "Item",
	'header2text', "Count",
	'header3text', "Owner",
	'header4text', "BagID",
	'header5text', "Type",
	'header6text', "SubType",
	'header7text', "EquipLoc",
	'columnWidth1', 200,
	'onClickRow', self.OnClickRow,
	'onEnterRow', self.OnMouseOver,
	'onLeaveRow', self.OnLeaveRow,
	'onInitHeader', function(column, button, fontString)
		if column == 3 then
			dewdrop:Register(button, 
				'children',  SimpleBankState.PlayerDropDown,
				'point', "TOPLEFT",
				'relativePoint', "BOTTOMLEFT"
			)
		elseif column == 4 then
			dewdrop:Register(button, 
				'children',  SimpleBankState.BagTypeDropDown,
				'point', "TOPLEFT",
				'relativePoint', "BOTTOMLEFT"
			)
		end

		button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		button:SetScript("OnClick", function(button, arg1)
			if arg1 == "LeftButton" then
				self:OnLeftClickHeaderButton(column)
			elseif arg1 == "RightButton" then
--				self:OnRightClickHeaderButton(column)
			end
		end)
	end,
	'onInitRow', function(frame)
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
	
	frame = tab:GetFrame()
	
	searchFrame:SetHeight(frame:GetHeight()+ 30 + searchFrame.editBox:GetHeight())
	searchFrame:SetWidth(frame:GetWidth()+ 24 )
	frame:SetParent(searchFrame)
	frame:SetPoint("TOPLEFT", searchFrame, "TOPLEFT", 12, -12)
	frame:SetPoint("BOTTOMRIGHT", searchFrame, "BOTTOMRIGHT", -12, 42 )
	frame:Show()

	self.tab = tab


	
	self.filter = {} 
	
	
	self:RegisterChatCommand({ "/sbs" }, {
		type = 'group',
		args = {
			show = {
				type = "execute",
				name = "Show",
				desc = "Toggle the search frame.",
				func = "ToggleFrame"
			}
		}
	})


	-- Load GUI
	if SBS_Frame then
		self:InitGUI()
	end
	
	table.insert(UISpecialFrames, "SBS_Frame")

	
	

end

function SimpleBankState:OnShowMenu() 
	local cat = tablet:AddCategory(
		'columns', 4,
		'text', "Item",
		'text2', "Count",
		'text3', "Owner",
		'text4', "BagID"
	)
	
	if self.itemListSize then
		for i=0, 20, 1 do
			local idx = i * ITEM_LIST_FIELD_SIZE + 1
			local itemLink = self.itemList[idx]
			local itemCount = self.itemList[idx+1]
			local playerName = self.itemList[idx+2]
			local bagID = self.itemList[idx+3]
			cat:AddLine(
				'text', itemLink,
				'text2', itemCount,
				'text3', playerName,
				'text4', bagID
			)
		end
	end

end

function SimpleBankState:OnLeftClickHeaderButton(column)
	ChatFrame1:AddMessage(column)
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



SimpleBankState.ItemCompareAsc = function(a, b)
	if SimpleBankState.actualSortKey == 6 and SimpleBankState:GetBagType(a[6]) ~= SimpleBankState:GetBagType(b[6]) then
		return SimpleBankState:GetBagType(a[6]) < SimpleBankState:GetBagType(b[6])
	end
	return itemList[a[SimpleBankState.actualSortKey]] < b[SimpleBankState.actualSortKey]
end

SimpleBankState.ItemCompareDesc = function(a, b)
	if SimpleBankState.actualSortKey == 6 and SimpleBankState:GetBagType(a[6]) ~= SimpleBankState:GetBagType(b[6]) then
		return SimpleBankState:GetBagType(a[6]) > SimpleBankState:GetBagType(b[6])
	end
	return a[SimpleBankState.actualSortKey] > b[SimpleBankState.actualSortKey]
end

-- sortKey: 1=itemName, 2=itemLink, 3=itemCount, 4=itemQuality, 5=charName, 6=bagType.
function SimpleBankState:SortItems(sortKey)

	if 1 then
		return true
	end
	if sortKey then
		if sortKey == self.sortKey then
			self.sortKey = -sortKey
		else
			self.sortKey = sortKey
		end
	end
	
	if not self.sortKey or not self.itemList then return end
	
	if self.sortKey > 0 then 
		self.actualSortKey = self.sortKey
		table.sort(itemIndexMap, self.ItemCompareAsc)
	else
		self.actualSortKey = - self.sortKey
		table.sort(itemIndexMap, self.ItemCompareDesc)
	end
	table.sort(itemIndexMap, self.sorter[self.sortKey])
end



function SimpleBankState:BuildIndex()

-- 	local itemMem, itemMemSum -- debug
-- 	local mem = gcinfo() -- debug
-- 	local timer = GetTime() -- debug
		
	local itemInfo, itemName, itemLink, itemQuality, itemCount;
	
	local listSize = 0;
	
	
	local itemList = self.itemList
	for k in pairs(itemList) do
		itemList[k] = nil
	end
	for k in pairs(itemIndexMap) do
		itemIndexMap[k] = nil
	end
	
-- 	itemMemSum = 0; -- debug
	for name in pairs(self.data[realm]) do	
		
		-- Player filter.
		if not self.filter.player or self.filter.player == name then
		
			for bagID in pairs(self.data[realm][name]) do
				local bagType = self:GetBagType(bagID);
				
				-- BagType filter.
				if not self.filter.bagType or self.filter.bagType == bagType then

					local n = table.getn(self.data[realm][name][bagID]);
				
					local index = 1;
					while index < n  do
					--for idx = 1, n, 2 do
					
						itemCount = self.data[realm][name][bagID][index+1];
						itemID = self.data[realm][name][bagID][index];
-- 							itemMem = gcinfo() -- debug
						itemName, itemLink, itemQuality = GetItemInfo(itemID);
-- 							itemMemSum = gcinfo() - itemMem + itemMemSum -- debug
							
						-- Rarity filter.
						if not self.filter.rarity or self.filter.rarity == itemQuality then
						
							-- Keyword filter.
							if itemName and ( not self.itemKeyword or string.find(string.lower(itemName), string.lower(self.itemKeyword)) )then
								table.insert(itemList,itemLink)
								table.insert(itemIndexMap, #itemList)
								table.insert(itemList,itemCount)
								table.insert(itemList,name)
								table.insert(itemList,bagID)
								listSize = listSize + 1;
							end
								
						end
						
						index = index + 2;
						
					end	
					
					
				end
			end
		end
	end

	
	self:SortItems();
	

	self.itemListSize = listSize;
	
-- 	DEFAULT_CHAT_FRAME:AddMessage(string.format("Mem: %d, ItemMem: %d, Time: %.3f", gcinfo() - mem, itemMemSum, GetTime() - timer)) -- debug
	
end


---------------------------------
-- Graphical Interface
---------------------------------

-- local dewdrop = DewdropLib:GetInstance("o1o.0");


function SimpleBankState:InitGUI()

	SBS_Frame_HeaderText:SetText(self.loc.TITLE);
	SBS_SortName:SetText(self.loc.ITEM_NAME);
	SBS_SortRarity:SetText(self.loc.RARITY);
	SBS_SortQuantity:SetText(self.loc.QUANTITY);
	SBS_SortPlayer:SetText(self.loc.PLAYER);
	SBS_SortBagType:SetText("Loc");
	SBS_SearchBoxText:SetText(self.loc.KEYWORD);
	SBS_RefreshButton:SetText(self.loc.REFRESH);
	SBS_SortItemType:SetText("Type")

	dewdrop:Register(SBS_SortRarity, 
		'children',  SimpleBankState.RarityDropDown,
		'point', "TOPLEFT",
		'relativePoint', "BOTTOMLEFT"
	)

	dewdrop:Register(SBS_SortPlayer, 
		'children',  SimpleBankState.PlayerDropDown,
		'point', "TOPLEFT",
		'relativePoint', "BOTTOMLEFT"
	)

	dewdrop:Register(SBS_SortBagType, 
		'children',  SimpleBankState.BagTypeDropDown,
		'point', "TOPLEFT",
		'relativePoint', "BOTTOMLEFT"
	)

end

function SimpleBankState:ToggleFrame()
	if SBS_Frame:IsShown() then
		SBS_Frame:Hide()
	else
		SBS_Frame:Show()
	end
end

function SimpleBankState:UpdateScrollFrame()

	local iItem;

	if (not SBS_Frame:IsVisible()) then return; end
	-- if (not self.itemList ) then self:BuildIndex() end --make sure
	if (not self.itemList) then return nil; end

	--start the scroll process
	--15 items and height of 16 each
	FauxScrollFrame_Update(SBS_ScrollFrame, self.itemListSize, 15, 16);

		
	--loop through the 15 frames
	for iItem = 1, 15, 1 do

		--grab the current item index and then get the itembar object itself
		local itemIndex = iItem + FauxScrollFrame_GetOffset(SBS_ScrollFrame);
		local button = getglobal("SBS_BrowseButton"..iItem);
		
		-- Save the reference so that we don't have to repeatly do string concantation.
		if not button.itemText then
			button.itemText = getglobal(button:GetName().."Item")
			button.amountText = getglobal(button:GetName().."Amount")
			button.characterText = getglobal(button:GetName().."Character")
			button.bagType = getglobal(button:GetName().."BagType")
			button.itemType = getglobal(button:GetName().."ItemType")
			button.itemSubType = getglobal(button:GetName().."ItemSubType")
		end

		--if it's still within boundaries then procezz
		if( itemIndex <= self.itemListSize ) then
		
			local idx = itemIndex * ITEM_LIST_FIELD_SIZE + 1
			local itemLink = self.itemList[idx]
			local itemCount = self.itemList[idx+1]
			local playerName = self.itemList[idx+2]
			local bagID = self.itemList[idx+3]

			if itemLink and bagID then
				
				local itemName, _, itemRarity, itemLevel, _, itemType, itemSubType = GetItemInfo(itemLink)
				
				button.itemText:SetText(itemName);
				button.itemLink = itemLink
				button.amountText:SetText(itemCount);
				--set color
				local color;
				if itemRarity then
					color = ITEM_QUALITY_COLORS[tonumber(itemRarity)];
					if color then
						button.itemText:SetTextColor(color.r, color.g, color.b);
						button.itemText.r = color.r;
						button.itemText.g = color.g;
						button.itemText.b = color.b;
					end
				else
					button.itemText.r = 0;
					button.itemText.g = 0;
					button.itemText.b = 0;
				end
				
				button.characterText:SetText( playerName );
				
				local bagType = self:GetBagType(bagID);
				local text;
				if bagType == "EQUIPMENT" or bagType == "MAIL" then
					text = self.loc[bagType];
				else
					text = string.format("%s(%d)", self.loc[bagType], bagID)
				end
				
				button.bagType:SetText(text)
				
				button.itemType:SetText(itemType)
				button.itemSubType:SetText(itemSubType)
				
			
				--show the item
				button:Show(); 

			else
				--nothing to show then hide it
				button:Hide();

			end

		else
			--error occured hide it
			button:Hide();

		end

	end --end for


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

function SimpleBankState.RarityDropDown()
	local self = SimpleBankState
	
	if not self.rarityTexts then
		local t = {}
		for i, rarity in ipairs({"POOR","NORMAL","GOOD","RARE","EPIC","LEGENDARY","ARTIFACT"}) do
			t[i-1] = ITEM_QUALITY_COLORS[i-1].hex .. self.loc[rarity] .. "|r"
		end
		self.rarityTexts = t
	end
	
	for i=0, 6, 1 do
		local text = self.rarityTexts[i]
		dewdrop:AddLine(
			'text', text,
			'func', self.SetFilter,
			'arg1', self,
			'arg2', 'rarity',
			'arg3', i,
			'closeWhenClicked', true
		)
	end
	
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

	if self.filter[field] == value then 
		self.filter[field] = nil
	else
		self.filter[field] = value;
	end

	self:UpdateFrameTitle();
	
	if self.itemList then
		self:BuildIndex()
		self:UpdateScrollFrame();
	end

	
end

function SimpleBankState:UpdateFrameTitle()

	if self.filter.player then
		SBS_SortPlayer:SetText(self.filter.player);
	else
		SBS_SortPlayer:SetText(self.loc.PLAYER);
	end
	
	if self.filter.bagType then
		SBS_SortBagType:SetText(self.loc[self.filter.bagType]);
	else
		SBS_SortBagType:SetText(self.loc.BAG_TYPE);
	end
	
	if self.filter.rarity then
		SBS_SortRarity:SetText( self.rarityTexts[self.filter.rarity] );
	else		
		SBS_SortRarity:SetText(self.loc.RARITY);
	end

end

function SimpleBankState:TitleButton_OnClick(button)
	local id = this:GetID()
	if button == "LeftButton" then
		SimpleBankState:SortItems(id)
		SimpleBankState:UpdateScrollFrame()
	end
end

function SimpleBankState:SBSFrame_OnHide()
	if dewdrop:IsOpen(SBS_SortRarity) or dewdrop:IsOpen(SBS_SortPlayer) or dewdrop:IsOpen(SBS_SortBagType) then
		dewdrop:Close()
	end
end

function SimpleBankState:OnValueChange(offset)
	if self.itemList then
		for i=1, 15 do
			local idx = offset + i
			local rowFrame = tab:GetRowFrame(i)
			local itemLink = self.itemList[itemIndexMap[idx]]
			local itemCount = self.itemList[itemIndexMap[idx]+1]
			local playerName = self.itemList[itemIndexMap[idx]+2]
			local bagID = self.itemList[itemIndexMap[idx]+3]
			local _, _, _, _, _, itemType, itemSubType, _, itemEquipLoc = GetItemInfo(itemLink)
			if itemLink then
				tab:FillRowData(i, itemLink, itemCount, playerName, bagID, itemType, itemSubType, itemEquipLoc)
				rowFrame.itemLink = itemLink
			else
				tab:HideRow(i)
			end
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




