local core = SimpleBankState
if not core then return end

local moduleName = "SimpleBankStateData"
local data = core:NewModule(moduleName)

local UPDATE_DELAY = 2
local EQUIP_ID = 100 -- Index of equipment in saved variables.
local MAIL_ID = 101

--local globals
local me = UnitName("player"); --the name of the current player that's logged on
local realm = GetRealmName(); --what realm we're on
local atBank; --is the current player at the bank or not

--------------------
-- Mini-Compost --
--------------------
local cache = setmetatable({}, {__mode='k'})
local function acquire()
	local t = next(cache)
	if t then cache[t] = nil else t = {} end
	return t
end
local function reclaim(t, depth)
	for k, v in pairs(t) do
		if depth and depth > 1 and type(v) == 'table' then
			reclaim(v, depth-1)
		end
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


function data:Initialize()

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
	
	self.pendingBags = {}
	
	self:StartRecording()
end

function data:StartRecording()
	self:ScheduleRepeatingTimer(moduleName, function() self:OnUpdate() end, UPDATE_DELAY)
	self:RegisterEvent("UNIT_INVENTORY_CHANGED")
	self:RegisterEvent("BAG_UPDATE")
	self:RegisterEvent("BANKFRAME_CLOSED")
	self:RegisterEvent("BANKFRAME_OPENED")
	self:RegisterEvent("PLAYERBANKSLOTS_CHANGED")
	self:RegisterEvent("MAIL_INBOX_UPDATE")
end

function data:StopRecording()
	self:CancelTimer(moduleName)
	self:UnregisterAllEvents()
end

function data:OnUpdate()

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

function data:UNIT_INVENTORY_CHANGED(event,unitid)
	self:Debug(2, "UNIT_INVENTORY_CHANGED")
	if unitid == 'player' then
		self.scanEquip = true
	end
end

function data:BAG_UPDATE(event, bagID)
	self:Debug(2, "BAG_UPDATE")
	self.scanBag = bagID
	self.pendingBags[bagID] = true
end

function data:BANKFRAME_OPENED()
	self:Debug(2, "BANKFRAME_OPENED")
	self.atBank = true
	self.scanBank = true
end

function data:BANKFRAME_CLOSED()
	self:Debug(2, "BANKFRAME_CLOSED")
	self.atBank = false
end

function data:PLAYERBANKSLOTS_CHANGED()
	self:Debug(2, "PLAYERBANKSLOTS_CHANGED")
	self.scanBag = BANK_CONTAINER
end

function data:MAIL_INBOX_UPDATE()
	self:Debug(2, "MAIL_INBOX_UPDATE")
	self.scanMail = true
end



--save all bank data about the current player
function data:SaveBankData()
	self:Debug(2, "Scanning bank...")
	
	self:SaveBagData(BANK_CONTAINER)
	local bagID;
	for bagID = 5, 10, 1 do
		self:SaveBagData(bagID)
	end
end

--saves all the data about the current player's bag
function data:SaveBagData(bagID)

	--don't save bank data unless you're at the bank
	if( self:IsBankBag(bagID) and not self.atBank ) then
		return;
	end

	self:Debug(2, "Scanning bag", bagID, "...")
	
	local size;
	if(bagID == KEYRING_CONTAINER) then
		size = GetKeyRingSize();
	else
		size = GetContainerNumSlots(bagID);
	end
	
	if(size > 0) then
		
		if self.data[realm][me][bagID] then
			self.data[realm][me][bagID] = recycle(self.data[realm][me][bagID])
		else
			self.data[realm][me][bagID] = acquire();
		end

		--save all item info
		for slot = 1, size, 1 do
			local itemID = self:ToID( GetContainerItemLink(bagID, slot) )
			if itemID then
				local _, count = GetContainerItemInfo(bagID, slot)
				table.insert(self.data[realm][me][bagID], itemID)
				table.insert(self.data[realm][me][bagID], count)
			end
		end
		
	else
		if self.data[realm][me][bagID] then
			reclaim(self.data[realm][me][bagID])
		end
		self.data[realm][me][bagID] = nil;		
	end
end

function data:SaveMailboxData()
	self:Debug(2, "Scanning mailbox...")
	
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

function data:SaveEquipmentData()

	self:Debug(2, "Scanning equipments...")
	
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
			"Bag0Slot" ,
			"Bag1Slot" ,
			"Bag2Slot" ,
			"Bag3Slot" ,
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





function data:IsBankBag(bagID)
	if bagID == BANK_CONTAINER or ( bagID >= 5 and bagID <= 10 ) then
		return true
	end
end


--takes a hyperlink (what you see in chat) and converts it to a shortened item link.
--a shortened item link is either the item:w:x:y:z form without the 'item:' part, or just the item's ID (the 'w' part)
function data:ToID(hyperLink)
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

