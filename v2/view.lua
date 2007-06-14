local dewdrop = AceLibrary("Dewdrop-2.0")


SimpleBankState = DongleStub("Dongle-1.1"):New("SimpleUnitFramesView")


-- Constants
local EQUIP_ID = 100 -- Index of equipment in saved variables.
local MAIL_ID = 101

--local globals
local me = UnitName("player"); --the name of the current player that's logged on
local realm = GetRealmName(); --what realm we're on

local tab
local searchFrame
local controllers = {}
function SimpleBankState:Enable()
	
	self.data = SBS_Data
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

	-- Column List Button
	frame = CreateFrame("Button", nil, searchFrame, "UIPanelButtonTemplate")
	frame:SetPoint("BOTTOMLEFT", searchFrame, "BOTTOMLEFT", 14, 13)
	frame:SetWidth(50)
	frame:SetHeight(24)
	frame:SetText("Show")
	frame:SetScript("OnClick", controllers.onClickColumnSelect)
	
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
		button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		button:SetScript("OnClick", function(button, arg1)
			if arg1 == "LeftButton" then
				controllers.onClickHeaderButton(this,column)
			elseif arg1 == "RightButton" then
				controllers.onRightClickHeaderButton(this,column)
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

	table.insert(UISpecialFrames, "SimpleBankStateSearchFrame")

	
	

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
	local sorter = {
		[1] = function(a,b) -- Name
			return GetItemInfo(ItemList[a]) < GetItemInfo(ItemList[b])
		end,
		[2] = function(a,b) -- Count
			return ItemList[a+1] < ItemList[b+1]
		end,
		[3] = function(a,b) -- Owner
			return ItemList[a+2] < ItemList[b+2]
		end,
		[4] = function(a,b) -- BagID
			return ItemList[a+3] < ItemList[b+3]
		end,
		[-1] = function(a,b) -- Name
			return GetItemInfo(a) > GetItemInfo(b)
		end,
		[-2] = function(a,b) -- Count
			return ItemList[a+1] > ItemList[b+1]
		end,
		[-3] = function(a,b) -- Owner
			return ItemList[a+2] > ItemList[b+2]
		end,
		[-4] = function(a,b) -- BagID
			return ItemList[a+3] > ItemList[b+3]
		end,
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
		ChatFrame1:AddMessage(index)
		return self[indexMap[index]], self[indexMap[index]+1], self[indexMap[index]+2], self[indexMap[index]+3]
	end
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
								ItemList:Add(itemLink,itemCount,name,bagID)
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


-- sortKey: 1=itemName, 2=itemLink, 3=itemCount, 4=itemQuality, 5=charName, 6=bagType.
function SimpleBankState:SortItems(sortKey)

	ItemList:Sort(1)

end

---------------------------------
-- Graphical Interface
---------------------------------


function SimpleBankState:ToggleFrame()
	if searchFrame:IsShown() then
		searchFrame:Hide()
	else
		searchFrame:Show()
	end
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
		tab:SetHeaderText(3,self.filter.player)
	else
		tab:SetHeaderText(self.loc.PLAYER)
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
	for i=1, 15 do
		local idx = offset + i
		local rowFrame = tab:GetRowFrame(i)
		if idx <= ItemList:GetSize() then
			local itemLink,itemCount,playerName,bagID = ItemList:Get(idx)
			local _, _, _, _, _, itemType, itemSubType, _, itemEquipLoc = GetItemInfo(itemLink)
			if itemLink then
				tab:FillRowData(i, itemLink, itemCount, playerName, bagID, itemType, itemSubType, itemEquipLoc)
				rowFrame.itemLink = itemLink
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


function controllers.onClickColumnSelect(frame)
	ChatFrame1:AddMessage("Under construction.")
end
function controllers.onClickHeaderButton(frame,column)
	ChatFrame1:AddMessage("left clicked " .. tostring(column))
end
function controllers.onRightClickHeaderButton(frame,column)
	ChatFrame1:AddMessage("right clicked " .. tostring(column))
end


