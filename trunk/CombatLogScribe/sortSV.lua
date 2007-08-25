local function Include(path)
	local module = assert(loadfile(path))
	module()
end

local typeValue = {
	["boolean"] = 0,
	["number"] = 1,
	["string"] = 2,
}

local function sorter(a,b)
	local ta, tb = typeValue[type(a)], typeValue[type(b)]
	if ta == 0 then
		return false
	elseif tb == 0 then
		return true
	elseif ta ~= tb then
		return ta < tb
	else
		return a < b
	end
end

function Sort(t, tab)
	local tmp = {}
	for k, v in pairs(t) do
		if type(k) == "table" then
			error("Cannot have a table as key")
		end
		table.insert(tmp, k)
	end
	table.sort(tmp, sorter)
	if not tab then tab = "" end
	tab = tab .. "\t"
	for i, k in ipairs(tmp) do
		local key = k
		local value = t[k]
		if type(key) == "string" then
			key = key:gsub("\\", "\\\\")
			key = key:gsub('\"', '\\"')
			key = key:gsub("\n", "\\n")
			key = key:gsub("\t", "\\t")
			key = '"'..key..'"'
		end
		if type(value) == "string" then
			value = value:gsub("\\", "\\\\")
			value = value:gsub('\"', '\\"')
			value = value:gsub("\n", "\\n")
			value = value:gsub("\t", "\\t")
			value = '"'..value..'"'
		end
		if type(value) == "table" then
			print(tab.."["..tostring(key).."] = {")
			Sort(value, tab)
			print(tab.."},")
		else
			if type(key) == "number" then
				print(tab..tostring(value)..",\t-- " .. tostring(key))
			else
				print(tab.."["..tostring(key).."] = "..tostring(value)..",")
			end
		end
	end
end

if not arg or not arg[1] then
	os.exit()
end


-- Record what globals we have.
local g = {}
for k in pairs(_G) do
	g[k] = true
end

-- Now load the file.
Include(arg[1])

-- Record what new variables are in the file.
local newKeys = {}
for k,v in pairs(_G) do
	if not g[k] then
		table.insert(newKeys, k)
	end
end

table.sort(newKeys, sorter)

for i, k in ipairs(newKeys) do
	local v = _G[k]
	if type(v) ~= 'table' then
		print(string.format("%s = %s", tostring(k), tostring(v)))
	else
		print(string.format("%s = {", tostring(k)))
		Sort(v)
		print("}")
	end
end
