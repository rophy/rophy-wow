
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


SimpleBankState = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceDebug-2.0", "AceConsole-2.0")

-- SimpleBankState.debug = true;

-- Constants
local EQUIP_ID = 100 -- Index of equipment in saved variables.
local MAIL_ID = 101

--local globals
local me = UnitName("player"); --the name of the current player that's logged on
local realm = GetRealmName(); --what realm we're on
local atBank; --is the current player at the bank or not


function SimpleBankState:OnInitialize()
	
	if not SBS_Data then 	
		SBS_Data = {
			version = self.version		
		}		
	end
	
	self.data = SBS_Data;
	
	if not self.data[realm]  then
		self.data[realm] = {};
	end
	
	if not self.data[realm][me]  then
		self.data[realm][me] = {};
	end
	
	if self.data.version ~= self.version then
		self:UpdateVersion();
	end

	self:RegisterEvent("UNIT_INVENTORY_CHANGED")
	self:RegisterEvent("BAG_UPDATE")
	self:RegisterEvent("BANKFRAME_CLOSED")
	self:RegisterEvent("BANKFRAME_OPENED")
	self:RegisterEvent("PLAYERBANKSLOTS_CHANGED")
	self:RegisterEvent("MAIL_INBOX_UPDATE")
	
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
	
	self:ScheduleRepeatingEvent(self.OnUpdate, UPDATE_DELAY, self)

	self.pendingBags = {}
	

end

function SimpleBankState:UNIT_INVENTORY_CHANGED(unitid)
	self:Debug("UNIT_INVENTORY_CHANGED")
	if unitid == 'player' then
		self.scanEquip = true
	end
end

function SimpleBankState:BAG_UPDATE(bagID)
	self:Debug("BAG_UPDATE")
	self.scanBag = bagID
	self.pendingBags[bagID] = true
end

function SimpleBankState:BANKFRAME_OPENED()
	self:Debug("BANKFRAME_OPENED")
	self.atBank = true
	self.scanBank = true
end

function SimpleBankState:BANKFRAME_CLOSED()
	self:Debug("BANKFRAME_CLOSED")
	self.atBank = false
end

function SimpleBankState:PLAYERBANKSLOTS_CHANGED()
	self:Debug("PLAYERBANKSLOTS_CHANGED")
	self.scanBag = BANK_CONTAINER
end

function SimpleBankState:MAIL_INBOX_UPDATE()
	self:Debug("MAIL_INBOX_UPDATE")
	self.scanMail = true
end


function SimpleBankState:OnUpdate()

	if self.scanMail then
		self:SaveMailboxData()
		self.scanMail = false
	end
	
	if self.scanBag then
		for bagID in pairs(self.pendingBags) do
			self:SaveBagData(bagID)
			self.pendingBags[bagID] = nil
		end
		self.scanBag = false
	end
	
	if self.scanEquip then
		self:SaveEquipmentData()
		self.scanEquip = false
	end
	
	if self.scanBank then
		self:SaveBankData()
		self.scanBank = false
	end
	
end



function SimpleBankState:UpdateVersion()
	self.data.version = self.version;
end


--------------------------
-- Data Recording
--------------------------


--save all bank data about the current player
function SimpleBankState:SaveBankData()
	self:Debug("Scanning bank...")
	
	self:SaveBagData(BANK_CONTAINER)
	local bagID;
	for bagID = 5, 10, 1 do
		self:SaveBagData(bagID)
	end
end

--saves all the data about the current player's bag
function SimpleBankState:SaveBagData(bagID)

	--don't save bank data unless you're at the bank
	if( self:IsBankBag(bagID) and not self.atBank ) then
		return;
	end

	self:Debug("Scanning bag", bagID, "...")
	
	local size;
	if(bagID == KEYRING_CONTAINER) then
		size = GetKeyRingSize();
	else
		size = GetContainerNumSlots(bagID);
	end
	
	if(size > 0) then
		local itemID, count;
		
		if self.data[realm][me][bagID] then
			self.data[realm][me][bagID] = recycle(self.data[realm][me][bagID]);
		else
			self.data[realm][me][bagID] = acquire();
		end

		--save all item info
		for slot = 1, size, 1 do
			itemID = self:ToID( GetContainerItemLink(bagID, slot) );
			if itemID then
				_, count = GetContainerItemInfo(bagID, slot);
				table.insert(self.data[realm][me][bagID], itemID);
				table.insert(self.data[realm][me][bagID], count);			
			end
		end
		
	else
		if self.data[realm][me][bagID] then
			reclaim(self.data[realm][me][bagID])
		end
		self.data[realm][me][bagID] = nil;		
	end
end

function SimpleBankState:SaveMailboxData()
	self:Debug("Scanning mailbox...")
	
	local size = GetInboxNumItems();
	if size > 0 then
		if self.data[realm][me][MAIL_ID] then
			self.data[realm][me][MAIL_ID] = recycle(self.data[realm][me][MAIL_ID]);
		else
			self.data[realm][me][MAIL_ID] = acquire();
		end
		
		for i=1, size, 1 do
			local link = GetInboxItemLink(i)
			if link then
				local name, _, quantity, quality = GetInboxItem(i);
				link = self:ToID(link)
				table.insert(self.data[realm][me][MAIL_ID], link);
				table.insert(self.data[realm][me][MAIL_ID], quantity);
			end
		end
	else
		
		if self.data[realm][me][MAIL_ID] then
			recycle(self.data[realm][me][MAIL_ID])
		end
		
		self.data[realm][me][MAIL_ID] = nil
		
	end
	
end

function SimpleBankState:SaveEquipmentData()

	self:Debug("Scanning equipments...")
	
	if not self.equipmentSlots then
		local inventorySlotNames = {
			"HeadSlot",
			"NeckSlot" ,
			"ShoulderSlot" ,
			"BackSlot" ,
			"ChestSlot" ,
			"ShirtSlot" ,
			"TabardSlot" ,
			"WristSlot" ,
			"HandsSlot" ,
			"WaistSlot" ,
			"LegsSlot" ,
			"FeetSlot" ,
			"Finger0Slot" ,
			"Finger1Slot" ,
			"Trinket0Slot" ,
			"Trinket1Slot" ,
			"MainHandSlot" ,
			"SecondaryHandSlot" ,
			"RangedSlot" ,
			"AmmoSlot" ,
		}
		
		local invSlotID;
		local slots = {};
		
		for i, inventorySlotName in pairs(inventorySlotNames) do
			invSlotID = GetInventorySlotInfo(inventorySlotName);
			table.insert(slots, invSlotID);
		end
		
		self.equipmentSlots = slots
	end

	local itemID, count;	
	
	if self.data[realm][me][EQUIP_ID] then
		self.data[realm][me][EQUIP_ID] = recycle(self.data[realm][me][EQUIP_ID]);
	else
		self.data[realm][me][EQUIP_ID] = acquire();
	end
	
	for i, invSlot in pairs(self.equipmentSlots) do
		itemID = self:ToID( GetInventoryItemLink("player", invSlot) );
		if itemID then
			count = GetInventoryItemCount("player", invSlot);
			table.insert(self.data[realm][me][EQUIP_ID], itemID);
			table.insert(self.data[realm][me][EQUIP_ID], count);
		end
	end

end





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

--takes a hyperlink (what you see in chat) and converts it to a shortened item link.
--a shortened item link is either the item:w:x:y:z form without the 'item:' part, or just the item's ID (the 'w' part)
function SimpleBankState:ToID(hyperLink)
	if hyperLink then
		local from,to,id,b,c,d,e,f,g,h = hyperLink:find("item:(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%-?%d+):(%-?%d+)")
		assert(from)
		if tonumber(b) == 0 and tonumber(c) == 0 and tonumber(d) == 0 and tonumber(e) == 0 and
			tonumber(f) == 0 and tonumber(g) == 0 and tonumber(h) == 0 then
			return id
		end
		return hyperLink:sub(from,to)
	end
end

SimpleBankState.ItemCompareAsc = function(a, b)
	if SimpleBankState.actualSortKey == 6 and SimpleBankState:GetBagType(a[6]) ~= SimpleBankState:GetBagType(b[6]) then
		return SimpleBankState:GetBagType(a[6]) < SimpleBankState:GetBagType(b[6])
	end
	return a[SimpleBankState.actualSortKey] < b[SimpleBankState.actualSortKey]	
end

SimpleBankState.ItemCompareDesc = function(a, b)
	if SimpleBankState.actualSortKey == 6 and SimpleBankState:GetBagType(a[6]) ~= SimpleBankState:GetBagType(b[6]) then
		return SimpleBankState:GetBagType(a[6]) > SimpleBankState:GetBagType(b[6])
	end
	return a[SimpleBankState.actualSortKey] > b[SimpleBankState.actualSortKey]
end

-- sortKey: 1=itemName, 2=itemLink, 3=itemCount, 4=itemQuality, 5=charName, 6=bagType.
function SimpleBankState:SortItems(sortKey)
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
		table.sort(self.itemList, self.ItemCompareAsc)
	else
		self.actualSortKey = - self.sortKey
		table.sort(self.itemList, self.ItemCompareDesc)
	end
end


function SimpleBankState:BuildIndex()

-- 	local itemMem, itemMemSum -- debug
-- 	local mem = gcinfo() -- debug
-- 	local timer = GetTime() -- debug
		
	local itemInfo, itemName, itemLink, itemQuality, itemCount;
	
	local listSize = 0;
	
	if not self.itemList then
		self.itemList = {}
	end
	
	local itemList = self.itemList
	for i, itemInfo in ipairs(itemList) do
		reclaim(itemInfo)
		itemList[i] = nil
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
								itemInfo = acquire()
								itemInfo[1] = itemName
								itemInfo[2] = itemLink
								itemInfo[3] = itemCount
								itemInfo[4] = itemQuality
								itemInfo[5] = name
								itemInfo[6] = bagID
								table.insert(itemList, itemInfo);
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

local dewdrop = AceLibrary("Dewdrop-2.0")
-- local dewdrop = DewdropLib:GetInstance("o1o.0");


function SimpleBankState:InitGUI()

	SBS_Frame_HeaderText:SetText(self.loc.TITLE);
	SBS_SortName:SetText(self.loc.ITEM_NAME);
	SBS_SortRarity:SetText(self.loc.RARITY);
	SBS_SortQuantity:SetText(self.loc.QUANTITY);
	SBS_SortPlayer:SetText(self.loc.PLAYER);
	SBS_SortBagType:SetText(self.loc.BAG_TYPE);
	SBS_SearchBoxText:SetText(self.loc.KEYWORD);
	SBS_RefreshButton:SetText(self.loc.REFRESH);

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
		end

		--if it's still within boundaries then procezz
		if( itemIndex <= self.itemListSize ) then

			--make sure the item is even in the array and that it has an sID
			if self.itemList[itemIndex]  then

				button.itemText:SetText(self.itemList[itemIndex][1]);
				button.itemLink = self.itemList[itemIndex][2];
				button.amountText:SetText( self.itemList[itemIndex][3] );
				--set color
				local color;
				if self.itemList[itemIndex][4] then
					color = ITEM_QUALITY_COLORS[tonumber(self.itemList[itemIndex][4])];
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
				
				button.characterText:SetText( self.itemList[itemIndex][5] );
				
				local bagType = self:GetBagType(self.itemList[itemIndex][6]);
				local text;
				if bagType == "EQUIPMENT" or bagType == "MAIL" then
					text = self.loc[bagType];
				else
					text = string.format("%s(%d)", self.loc[bagType], self.itemList[itemIndex][6])
				end
				
				button.bagType:SetText(text)
				
			
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
end

function SimpleBankState:SearchItem()
	local text = this:GetText();
	if not text then return end
	
	self.itemKeyword = text;
	self:BuildIndex();
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

