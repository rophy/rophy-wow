--[[
	This script  converts GlobalStrings.lua into a table.
]]

-- Copy down the basic global variables.
local basic = {}
for k, v in pairs(_G) do
	basic[k] = v
end

-- Now load the patterns.
require("GlobalStrings")
local patterns = {}
for k, v in pairs(_G) do
	if type(v) == "string" and not basic[k] then
		table.insert(patterns, k)
	end
end

print("function GetGlobalStringList()")
print("\treturn {")
for _, v in pairs(patterns) do
	print('\t\t"' .. v .. '",')
end
print("\t}")
print("end")





