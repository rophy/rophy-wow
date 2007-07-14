--[[
	transaction.lua : tracks money change transactions.
	
	TODO: 
		- purge data : merge all transactions (per character) into one 'opening' transaction.
		
	Optimization:
		- separate timestamp to another list for faster time range search, a big trade off between time and space.
		- (DONE) transaction list records the beginning timestamp, and each transaction's timestamp substracts it to reduce size.
		- (DONE) maps categories to integers in the saved variables.
	
	saved variable format:
	rAccountantData = {
		version = DATA_FORMAT_VERSION,
		transactions = {
			["Tichronius - Alliance"] = {
				["Ballis"] = {
					"timeOffset,category,amount",
					"timeOffset,category,amount",
					"timeOffset,category,amount",
					...,
					["timestamp"] = 12313213123,
					["cash"] = 12345
				}
			}
		}
	}
]]

Transaction = DongleStub("Dongle-1.1"):New("rAccountant_Transaction")

local globalDB, playerDB
local playerName, serverName = UnitName('player'), GetRealmName() .. ' - ' .. UnitFactionGroup('player')
local currCategory,prevCategory
local prevMoney = 0
local DATA_FORMAT_VERSION = 1

local L = setmetatable({}, {__index = function(t,k) return k end})

local categoryMap = {
	opening = 0,
	reconcile = 1,
	unknown = 2,
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
do
	local cache = {}
	for k,v in pairs(categoryMap) do
		cache[v] = k
	end
	for v,k in pairs(cache) do
		categoryMap[v] = k
	end
	cache = nil
end
setmetatable(categoryMap, {
	__index = function(t,k)
		error(string.format("trying to access non-exist entry '%s' in categoryMap.", tostring(k)))
	end
})

local function SetCurrCategory(category)
	-- This check mainly attempts to prevent two 'unknown' events in a row.
	if category ~= currCategory then
		prevCategory = currCategory
		currCategory = category
	end
end



function Transaction:Initialize()
	self.hooks = {}
	self:EnableDebug(2)
	self.categoryMap = categoryMap
end

function Transaction:Enable()

	self:InitialDB()

	self:Reconcile()
	
	self:Toggle(true)
end

function Transaction:InitialDB()
	
	if not rAccountantData then
		rAccountantData = {
			version = DATA_FORMAT_VERSION,
			transactions = {},
		}
	end
	
	local dataVersion = rAccountantData and rAccountantData.version
	
	-- Begin of DB upgrade procedure.
	
	-- End of DB upgrade procedure.
	
	globalDB = rAccountantData.transactions
	
	
	if not globalDB[serverName] then
		globalDB[serverName] = {}
	end
	if not globalDB[serverName][playerName] then
		globalDB[serverName][playerName] = {
			timestamp = time()
		}
		playerDB = globalDB[serverName][playerName]
		self:AddData(GetMoney(), categoryMap["opening"], GetMoney())
	else
		playerDB = globalDB[serverName][playerName]
	end
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

--[[ Event Handlers ]]--
function Transaction:MERCHANT_SHOW()
	self:Debug(3, "MERCHANT_SHOW")
	if CanMerchantRepair() then self:AutoRepairPlease() end
	SetCurrCategory(categoryMap["merch"])
end

function Transaction:CONFIRM_TALENT_WIPE()
	self:Debug(3, "CONFIRM_TALENT_WIPE")
	SetCurrCategory(categoryMap["train"])
end

function Transaction:MERCHANT_CLOSED()
	self:Debug(3, "MERCHANT_CLOSED")
	SetCurrCategory(categoryMap["unknown"])
end

function Transaction:QUEST_COMPLETE()
	self:Debug(3, "QUEST_COMPLETE")
	SetCurrCategory(categoryMap["quest"])
end

function Transaction:LOOT_OPENED()
	self:Debug(3, "LOOT_OPENED")
	SetCurrCategory(categoryMap["loot"])
end

function Transaction:TAXIMAP_OPENED()
	self:Debug(3, "TAXIMAP_OPENED")
	SetCurrCategory(categoryMap["taxi"])
end

function Transaction:TRADE_SHOW()
	self:Debug(3, "TRADE_SHOW")
	SetCurrCategory(categoryMap["trade"])
end

function Transaction:TRADE_CLOSE()
	self:Debug(3, "TRADE_CLOSE")
	SetCurrCategory(categoryMap["unknown"])
end

function Transaction:MAIL_SHOW()
	self:Debug(3, "MAIL_SHOW")
	SetCurrCategory(categoryMap["mail"])
end

function Transaction:MAIL_CLOSED()
	self:Debug(3, "MAIL_CLOSED")
	SetCurrCategory(categoryMap["unknown"])
end

function Transaction:TRAINER_SHOW()
	self:Debug(3, "TRAINER_SHOW")
	SetCurrCategory(categoryMap["train"])
end

function Transaction:TRAINER_CLOSED()
	self:Debug(3, "TRAINER_CLOSED")
	SetCurrCategory(categoryMap["unknown"])
end

function Transaction:AUCTION_HOUSE_SHOW()
	self:Debug(3, "AUCTION_HOUSE_SHOW")
	SetCurrCategory(categoryMap["ah"])
end

function Transaction:AUCTION_HOUSE_CLOSED()
	self:Debug(3, "AUCTION_HOUSE_CLOSED")
	SetCurrCategory(categoryMap["unknown"])
end

function Transaction:CHAT_MSG_MONEY(event, arg1)
	self:Debug(3, "CHAT_MSG_MONEY")

	-- Parse the message for money gained. 
	local gold = arg1:match("(%d+) " .. GOLD)
	local silver = arg1:match("(%d+) " .. SILVER)
	local copper = arg1:match("(%d+) " .. COPPER)
	
	gold = (gold and tonumber(gold)) or 0
	silver = (silver and tonumber(silver)) or 0
	copper = (copper and tonumber(copper)) or 0
	
	local money = copper + silver * 100 + gold * 10000

	-- This will suppress the incoming PLAYER_MONEY event. 
	self:AddData(money, categoryMap["loot"], GetMoney()+money)
	
end

--[[ Hook Functions ]]--


function Transaction:InboxFrame_OnClick(mailIndex,...)
	self:Debug(3, "InboxFrame_OnClick")	
	local _, _, sender, subject, money, CODAmount, _, hasItem, _, _, _, _= GetInboxHeaderInfo(mailIndex)
	if sender ~= nil then
		if sender:find(L["Auction House"]) then
			currCategory = categoryMap["ah"]
		else
			currCategory = categoryMap["mail"]
		end
	else
		currCategory = categoryMap["mail"]
	end
end

--[[ Data Manipulation ]]--

function Transaction:CheckMoney()
	local currMoney = GetMoney()
	
	local diffMoney = currMoney - prevMoney
	
	if diffMoney == 0 then
		self:Debug(2, "CheckMoney: money didn't change.")
		return
	end
	
	local category = currCategory
	
	if category == categoryMap["unknown"] then
		if category ~= prevCategory then
			self:Print(L["Unknown transaction, treating it as previous category '%s'."]:format(categoryMap[prevCategory]))
			category = prevCategory
		else
			self:Print(L["Unknown transaction, amount: %d."]:format(diffMoney))
		end
	end
	
	self:AddData(diffMoney, category, currMoney)
	
end


-- Synchronize gold between playerDB.cash and current cash.
function Transaction:Reconcile()
	prevMoney = playerDB.cash
	currCategory = categoryMap["reconcile"]
	self:CheckMoney()
	currCategory = categoryMap["unknown"]
end

-- Synchronize gold between transaction total and current cash.
function Transaction:Synchronize()
	local size = self:GetSize(playerName,serverName)
	local total = 0
	for i=1, size do
		local _, amount = self:GetData(i, playerName, serverName)
		total = total + amount
	end
	prevMoney = total - GetMoney()
	SetCurrCategory(categoryMap["reconcile"])
	self:CheckMoney()
	SetCurrCategory(categoryMap["unknown"])
end


--[[
	AddData
		
		Inserts a transaction to the current playerDB, which will have the timestamp set to now.
		
		Inputs:
			- amount : amount of the transaction, positive for income, negative for expense.
			- category (optional): category of the transaction, defaults to currCategory.
			- currMoney (optional): the DB needs to record the current amount of gold for reconsilation,
				defaults to GetMoney() if not provided. This input exists because sometimes you
				want to add a transaction before the actual PLAYER_MONEY event occurs, in that case
				you'll provide a value other than GetMoney().
			
		Return: none
]]
function Transaction:AddData(amount, category, currMoney)
	if amount then
		-- default values
		if not category then category = currCategory end
		if not currMoney then currMoney = GetMoney() end
		
		-- a transaction records the currCategory, timestamp and amount.
		local timestamp = time() - playerDB.timestamp
		local transaction = string.format("%d,%d,%d", timestamp, category, amount)
		self:Debug(2, "AddData", categoryMap[category], date(), amount)
		table.insert(playerDB, transaction)
		playerDB.cash = currMoney
		prevMoney = currMoney
	end
end


--[[
	GetData
		
		Obtains a transaction record.
		
		Inputs:
			- index : index of the transaction.
			- player : name of the player.
			- server : name of the server obtained by IterateServers().
			
		Return:  timestamp, amount, category
]]
function Transaction:GetData(index, player, server)
	local transactions = globalDB[server] and globalDB[server][player]
	if transactions then
		local transaction = transactions[index]
		if transaction then
			local timestamp, category, amount = string.split(',', transaction)
			return tonumber(timestamp)+transactions.timestamp, tonumber(amount), tonumber(category)
		end
	end
end

-- Get the current server name.
function Transaction:GetCurrentServerName()
	return serverName
end

-- Iterate through the servers names.
function Transaction:IterateServers()
	return pairs(globalDB)
end

-- Iterate through the player names.
function Transaction:IteratePlayers(server)
	return pairs(globalDB[server])
end

--[[
	GetSize
		
		Return the transaction size.
		
		Inputs
			- player : name of the player.
			- server : name of the server obtained by IterateServers().
			
		Returns
			- transactionSize
]]
function Transaction:GetSize(player,server)
	return (globalDB[server] and globalDB[server][player] and #globalDB[server][player]) or 0
end

--[[
	SearchByTime
		
		Given a time range, search the player transactions where the timestamp is within the time range.
		Currently uses binary search for O(log(n)) speed, thanks Tem for helping out!
		
		Inputs
			- startTime : timestamp must >= this.
			- endTime : timestamp must <= this.
			- player : name of the player.
			- server : name of the server obtained by IterateServers().
			
		Return: false or startIndex, endIndex
			- false : when there is transactions matching the time range.
			- startIndex, endIndex : the index bounds matching the time range.
		
]]
function Transaction:SearchByTime(startTime, endTime, player, server)
	if not globalDB[server] or not globalDB[server][player] then return false end
	
	local function binarySearch(target,low,high)
		if low < high then
				local mid = floor((low + high)/2)
				local val = self:GetData(mid,player,server)
				if val == target then
						return mid, val
				elseif val > target then
						return binarySearch(target,low,mid-1)
				else
						return binarySearch(target,mid+1,high)
				end
		else
				return low, self:GetData(low,player,server)
		end
	end

	-- Binary search for the start and end index.
	local maxIndex = #globalDB[server][player]
	local closestLow, closestLowValue = binarySearch(startTime,1,maxIndex)
	local closestHigh, closestHighValue = binarySearch(endTime,1,maxIndex)
	if closestLowValue < startTime then
		closestLow = closestLow + 1
		closestLowValue = self:GetData(closestLow,player,server)
	end
	if closestHighValue > endTime then
		closestHigh = closestHigh - 1
		closestHighValue = self:GetData(closestHigh,player,server)
	end
	if closestLowValue and closestHighValue and closestLowValue >= startTime and closestHighValue <= endTime then
		return closestLow,closestHigh
	else
		return false
	end
end

-- Code stolen from FuBar_AuditorFu by Alarisha.
function Transaction:AutoRepairPlease()
	local repairCost = GetRepairAllCost()
	local currMoney = GetMoney()
	if currMoney < repairCost then
		self:Print(L["Insufficient funds are available to perform an Auto-Repair."])
	elseif repairCost > 0 then
		-- This will suppress the incoming PLAYER_MONEY event. 
		self:AddData(-repairCost, categoryMap["repairs"], currMoney-repairCost)
		RepairAllItems()
		self:Print(L["Auto-Repair Successful: "] .. -repairCost)
	end
end


