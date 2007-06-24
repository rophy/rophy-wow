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