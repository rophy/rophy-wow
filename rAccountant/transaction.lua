--[[
	transaction.lua : tracks money change transactions.
	
	TODO: 
		- purge data : merge all transactions (per character) into one 'opening' transaction.
		- the ability to manually add, delete, edit transaction especially those in category 'reconcile'.
	
	saved variable format:
	["Tichronius - Alliance"] = {
		["Ballis"] = {
			"category,timestamp,amount",
			"category,timestamp,amount",
			"category,timestamp,amount",
			...,
			["cash"] = 12345
		}
	}
]]

Transaction = DongleStub("Dongle-1.1"):New("rAccountant_Transaction")

local globalDB, playerDB
local playerName, serverName
local currCategory = ""
local prevMoney = 0
local timeOffset = 1182593000

local L = setmetatable({}, {__index = function(t,k) return k end})

--[[ Currently not used
local categoryMap = {
	reconcile = 1,
	other = 2,
	error = 3,
	merch = 4,
	train = 5,
	quest = 6,
	loot = 7,
	taxi = 8,
	trade = 9,
	mail = 10,
	train = 11,
	ah = 12,
	repairs = 13,
}
for k,v in pairs(categoryMap) do
	categoryMap[v] = k
end
]]

function Transaction:Initialize()
	self.hooks = {}
	self:EnableDebug(2)
end

function Transaction:Enable()

	playerName = UnitName('player')
	serverName = GetRealmName() .. ' - ' .. UnitFactionGroup('player')
	
	if not rAccountantData then
		rAccountantData = {}
	end
	globalDB = rAccountantData
	
	if not globalDB[serverName] then
		globalDB[serverName] = {}
	end
	if not globalDB[serverName][playerName] then
		globalDB[serverName][playerName] = {}
		playerDB = globalDB[serverName][playerName]
		self:AddData(GetMoney(), "opening", GetMoney())
	else
		playerDB = globalDB[serverName][playerName]
	end
	
	self:Reconcile()
	
	self:Toggle(true)
end

function Transaction:Toggle(enable)
	if enable == nil then
		self.enabled = not self.enabled
	else
		self.enabled = enable
	end
	if self.enabled then
		self:RegisterEvents()
		self:RegisterHooks()
		self:Debug(2, "Enabled")
	else
		self:UnregisterEvents()
		self:UnregisterHooks()
		self:Debug(2, "Disabled")
	end
end

function Transaction:RegisterEvents()
	self:RegisterEvent("MERCHANT_SHOW")
	self:RegisterEvent("MERCHANT_CLOSED")
	self:RegisterEvent("QUEST_COMPLETE")
	self:RegisterEvent("LOOT_OPENED")
	self:RegisterEvent("TAXIMAP_OPENED")
	self:RegisterEvent("TRADE_SHOW")
	self:RegisterEvent("TRADE_CLOSE")
	self:RegisterEvent("MAIL_SHOW")
	self:RegisterEvent("MAIL_CLOSED")
	self:RegisterEvent("TRAINER_SHOW")
	self:RegisterEvent("TRAINER_CLOSED")
	self:RegisterEvent("AUCTION_HOUSE_SHOW")
	self:RegisterEvent("AUCTION_HOUSE_CLOSED")
	self:RegisterEvent("CHAT_MSG_MONEY")
	self:RegisterEvent("PLAYER_MONEY", "CheckMoney")
	self:RegisterEvent("CONFIRM_TALENT_WIPE")
end

function Transaction:UnregisterEvents()
	self:UnregisterAllEvents()
end

function Transaction:RegisterHooks()
	if not self.hooks.InboxFrame_OnClick then
		-- AH Mail Hook
		self.hooks.InboxFrame_OnClick = InboxFrame_OnClick
		InboxFrame_OnClick = function(...)
			self:InboxFrame_OnClick(...)
			return self.hooks.InboxFrame_OnClick(...)
		end
	end
end

function Transaction:UnregisterHooks()
	if self.hooks.InboxFrame_OnClick then
		InboxFrame_OnClick = self.hooks.InboxFrame_OnClick
		self.hooks.InboxFrame_OnClick = nil
	end
end

function Transaction:Reconcile()
	prevMoney = playerDB.cash
	currCategory = "reconcile"
	self:CheckMoney()
	currCategory = ""
end

--[[ Event Handlers ]]--
function Transaction:MERCHANT_SHOW()
	self:Debug(2, "MERCHANT_SHOW")
	if CanMerchantRepair() then self:AutoRepairPlease() end
	currCategory = "merch"
end

function Transaction:CONFIRM_TALENT_WIPE()
	self:Debug(2, "CONFIRM_TALENT_WIPE")
	currCategory = "train"
end

function Transaction:MERCHANT_CLOSED()
	self:Debug(2, "MERCHANT_CLOSED")
	--currCategory = ""
end

function Transaction:QUEST_COMPLETE()
	self:Debug(2, "QUEST_COMPLETE")
	currCategory = "quest"
end

function Transaction:LOOT_OPENED()
	self:Debug(2, "LOOT_OPENED")
	currCategory = "loot"
end

function Transaction:TAXIMAP_OPENED()
	self:Debug(2, "TAXIMAP_OPENED")
	currCategory = "taxi"
end

function Transaction:TRADE_SHOW()
	self:Debug(2, "TRADE_SHOW")
	currCategory = "trade"
end

function Transaction:TRADE_CLOSE()
	self:Debug(2, "TRADE_CLOSE")
	--currCategory = ""
end

function Transaction:MAIL_SHOW()
	self:Debug(2, "MAIL_SHOW")
	currCategory = "mail"
end

function Transaction:MAIL_CLOSED()
	self:Debug(2, "MAIL_CLOSED")
	--currCategory = ""
end

function Transaction:TRAINER_SHOW()
	self:Debug(2, "TRAINER_SHOW")
	currCategory = "train"
end

function Transaction:TRAINER_CLOSED()
	self:Debug(2, "TRAINER_CLOSED")
	--currCategory = ""
end

function Transaction:AUCTION_HOUSE_SHOW()
	self:Debug(2, "AUCTION_HOUSE_SHOW")
	currCategory = "ah"
end

function Transaction:AUCTION_HOUSE_CLOSED()
	self:Debug(2, "AUCTION_HOUSE_CLOSED")
	--currCategory = ""
end

function Transaction:CHAT_MSG_MONEY(event, arg1)
	self:Debug(2, "CHAT_MSG_MONEY")

	-- Parse the message for money gained. 
	local gold = arg1:match("(%d+) " .. GOLD)
	local silver = arg1:match("(%d+) " .. SILVER)
	local copper = arg1:match("(%d+) " .. COPPER)
	
	gold = (gold and tonumber(gold)) or 0
	silver = (silver and tonumber(silver)) or 0
	copper = (copper and tonumber(copper)) or 0
	
	local money = copper + silver * 100 + gold * 10000

	-- This will suppress the incoming PLAYER_MONEY event. 
	self:AddData(money, "loot", GetMoney()+money)
	
end

--[[ Hook Functions ]]--
function Transaction:InboxFrame_OnClick(mailIndex,...)
	self:Debug(2, "InboxFrame_OnClick")	
	local _, _, sender, subject, money, CODAmount, _, hasItem, _, _, _, _= GetInboxHeaderInfo(mailIndex)
	if sender ~= nil then
		if sender:find(L["Auction House"]) then
			currCategory = "ah"
		else
			currCategory = "mail"
		end
	else
		currCategory = "mail"
	end
end

--[[ Data Manipulation ]]--
function Transaction:CheckMoney()
	self:Debug(2, "CheckMoney")
	
	local currMoney = GetMoney()
	
	local diffMoney = currMoney - prevMoney
	
	if diffMoney == 0 then
		self:Debug(2, "CheckMoney: money didn't change.")
		return
	end

	-- Deals with random cash from an obfuscated source. Good word, eh?
	if currCategory == "" then
		self:Print("Error: unknown transaction",diffMoney)
		currCategory = "error"
	end
	
	
	self:AddData(diffMoney, currCategory, currMoney)
	
	
end

function Transaction:AddData(amount, category, currMoney)
	if amount then
		-- default values
		if not category then category = currCategory end
		if not currMoney then currMoney = GetMoney() end
		
		-- a transaction records the currCategory, timestamp and amount.
		-- timestamp substracts a constant offset to reduce the size.
		local timestamp = time() - timeOffset
		local transaction = string.format("%s,%d,%d", category, timestamp, amount)
		-- local transaction = string.format("%d,%d,%d", categoryMap[category], timestamp, amount)
		self:Debug(2, "AddData", category, date(), amount)
		table.insert(playerDB, transaction)
		playerDB.cash = currMoney
		prevMoney = currMoney
	end
end

function Transaction:GetData(index, player, server)
	if not player then player = playerName end
	if not server then server = serverName end
	
	local transaction = globalDB[server][player][index]
	if transaction then
		local category, timestamp, amount = string.split(',', transaction)
		return category, tonumber(timestamp)+timeOffset, tonumber(amount)
--		local tmodeNumber, timestamp, amount = string.split(',', transaction)
--		return categoryMap[tonumber(tmodeNumber)], tonumber(timestamp)+timeOffset, tonumber(amount)
	end
end

-- Code stolen from FuBar_AuditorFu by Alarisha.
function Transaction:AutoRepairPlease()
	local repairCost = GetRepairAllCost()
	local currMoney = GetMoney()
	if currMoney < repairCost then
		self:Print("Insufficient funds are available to perform an Auto-Repair.")
	elseif repairCost > 0 then
		if repairCost > 0 then
			-- This will suppress the incoming PLAYER_MONEY event. 
			self:AddData(repairCost, "repairs", currMoney-repairCost)
			RepairAllItems()
			self:Print("Auto-Repair Successful: " .. repairCost)
		end
	end
end


