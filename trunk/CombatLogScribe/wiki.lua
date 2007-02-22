--[[ 
	This script converts CombatLogScribe saved variables to a ready to use wiki page.
]]


require("CombatLogScribe")
require("GlobalStrings")

local t = CombatLogScribeDB.events

-- Get a sorted event index.
s ={}
for event in pairs(t) do
	table.insert(s, event)
end
table.sort(s)


-- Loop through events with the sorted index
for i, event in pairs(s) do
	
	-- Get a sorted pattern index for the current event.
	local s2 = {}
	for pattern in pairs(t[event]) do
		table.insert(s2, pattern)
	end
	table.sort(s2)

	print( string.format("=== %s ===\n", event) )
	
	-- Loop through patterns with the sorted index.	
	for j, pattern in pairs(s2) do	
		print( "* " .. pattern)
		if _G[pattern] then 
			print( "** " .. _G[pattern] )
		else
			print( "** " .. t[event][pattern][1] )
		end
		print( "** " .. t[event][pattern][2] )
		print("")		
	end
end

