--[[
	summary.lua : calculates summary report from the transactions.
	
	Sums by character, category, date (daily, weekly, monthly, yearly, custom)
	
	Category Summary
		example:
			Category    Income      Expense      Overall
			Loot                4000                 0           4000
			Merchant      50000         3000         47000
			Mail                       0             400            -400
			Repair                    0         10000        -10000
			Total              54000        13400         40600
			
	Character Summary
		example:
			Character       Income       Expense        Overall
			Rophy               10000            5000            5000
			Ballis                  4000          10000           -6000
			Total                 14000          15000            -1000
			

]]
local transaction = Transaction
local tablet = AceLibrary("Tablet-2.0")

if not transaction then return end

Summary = DongleStub("Dongle-1.1"):New("rAccountant_Summary")

--[[ Filters ]]--
local beginTime, endTime
local players = {}
local categories = {}
local server = transaction:GetCurrentServerName()

function Summary:Enable()
--[[
	local catFrame = CreateFrame("Frame")
	
	tablet:Register(catFrame,
		'children', function() self:ShowMenu() end,
		'dontHook', true,
		'cantAttach', true
	)
	
	tablet:Open(catFrame)
	
	local playerFrame = CreateFrame("Frame")
	tablet:Register(playerFrame,
		'children', function() self:ShowPlayerSummary() end,
		'dontHook', true,
		'cantAttach', true
	)
	
	tablet:Open(playerFrame)
]]
end

local reportIndex = { "Total" }
local reports = {
	Total = {
		income = 0,
		expense = 0
	}
}

function Summary:ShowPlayerSummary()

	
	cat = tablet:AddCategory(
		'text', "Character Summary",
		'showWithoutChildren', true
	)
	
	cat = tablet:AddCategory('columns', 2)
	
	cat:AddLine(
		'text', "Date",
		'text2', "All"
	)
	
	
	
	cat = tablet:AddCategory(
		'text', "Character",
		'text2', "Income",
		'text3', "Expense",
		'text4', "Net",
		'columns', 4
	)
	
	local totalIncome, totalExpense = 0,0
	
	for player in transaction:IteratePlayers(server) do
		if not players[player] then	-- player filter.
			local income, expense = 0, 0
			local from, to = 1, transaction:GetSize(player,server) -- transaction:SearchByTime(beginTime, endTime, player, server)
			if from then
				for i=from, to do
					local _, amount, cat = transaction:GetData(i,player,server)
					if not categories[cat] then	-- category filter.
						if amount > 0 then
							income = income + amount
						else
							expense = expense - amount
						end
					end
				end
			end
			totalIncome = totalIncome + income
			totalExpense = totalExpense + expense
			cat:AddLine(
				'text', player,
				'text2', income,
				'text3', expense,
				'text4', income-expense
			)
		end
	end
	
	cat:AddLine(
		'text', "Total",
		'text2', totalIncome,
		'text3', totalExpense,
		'text4', totalIncome-totalExpense
	)

end
function Summary:ShowMenu()

	self:RefreshCategoryReport()
	local cat
	
	cat = tablet:AddCategory(
		'text', "Category Summary",
		'showWithoutChildren', true
	)
	
	cat = tablet:AddCategory('columns', 2)
	
	cat:AddLine(
		'text', "Date",
		'text2', "All"
	)
	
	
	
	cat = tablet:AddCategory(
		'text', "Category",
		'text2', "Income",
		'text3', "Expense",
		'text4', "Net",
		'columns', 4
	)
	
	for i, catName in ipairs(reportIndex) do
		local t = reports[catName]
		if t.income > 0 or t.expense > 0 then
			cat:AddLine(
				'text', catName == "Total" and "Total" or transaction.categoryMap[catName],
				'text2', t.income,
				'text3', t.expense,
				'text4', t.income-t.expense
			)
		end	
	end
end


-- Sample player report.
function Summary:PlayerReport()
	-- beginTime, endTime = time()-60*60*24*2, time()
	
	self:Print("Player, Income, Expense, Net")
	for player in transaction:IteratePlayers(server) do
		if not players[player] then	-- player filter.
			local income, expense = 0, 0
			local from, to = 1, transaction:GetSize(player,server) -- transaction:SearchByTime(beginTime, endTime, player, server)
			if from then
				for i=from, to do
					local _, amount, cat = transaction:GetData(i,player,server)
					if not categories[cat] then	-- category filter.
						if amount > 0 then
							income = income + amount
						else
							expense = expense - amount
						end
					end
				end
			end
			self:Print(player,income,expense,income-expense)
		end
	end
end


-- Sample category report.
function Summary:RefreshCategoryReport()
	
	for k, t in pairs(reports) do
		t.income = 0
		t.expense =0
	end
	
	local needSort = false
	for player in transaction:IteratePlayers(server) do
		if not players[player] then	-- player filter.
			local from, to = 1, transaction:GetSize(player,server) -- transaction:SearchByTime(beginTime, endTime, player, server)
			if from then
				for i=from, to do
					local _, amount, cat = transaction:GetData(i,player,server)
					if not categories[cat] then	-- category filter.
						if not reports[cat] then
							reports[cat] = {
								income = 0,
								expense = 0
							}
							table.insert(reportIndex, cat)
							needSort = true
						end
						if amount > 0 then
							reports[cat].income = reports[cat].income + amount
						else
							reports[cat].expense = reports[cat].expense - amount
						end
					end
				end
			end
		end
	end
	
	for cat, t in pairs(reports) do
		if cat ~= "Total" then
			reports.Total.income = reports.Total.income + t.income
			reports.Total.expense = reports.Total.expense + t.expense
		end
	end
	
	
	if needSort then
		table.sort(reportIndex, function(a,b)
			if a == "Total" then
				return false
			elseif b == "Total" then
				return true
			else
				return transaction.categoryMap[a] < transaction.categoryMap[b]
			end
		end)
	end
	

end

