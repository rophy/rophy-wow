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

if not transaction then return end

Summary = DongleStub("Dongle-1.1"):New("rAccountant_Summary")

--[[ Filters ]]--
local beginTime, endTime
local players = {}
local categories = {}
local server = transaction:GetCurrentServerName()

function Summary:PlayerReport()
	beginTime, endTime = time()-60*60*24*2, time()
	
	local income, expense = 0, 0
	for player in transaction:IteratePlayers(server) do
		if not players[player] then	-- player filter.
			local from, to = transaction:SearchByTime(beginTime, endTime, player, server)
			if from then
				for i=from, to do
					local cat,_,amount = transaction:GetData(i)
					
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

