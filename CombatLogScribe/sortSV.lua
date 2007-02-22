function Include(path)	
	local module = assert(loadfile(path))
	module()
end

function Sort(t, tab)
	local tmp = {}
	for k, v in pairs(t) do
		table.insert(tmp, k)
	end
	table.sort(tmp, function(a,b) 
		if type(a) == "number" then
			if type(b) ~= "number" then
				return true
			else
				return a < b
			end
		else
			if type(b) == "number" then
				return false
			else
				return tostring(a) < tostring(b)
			end
		end
	end)
	if not tab then tab = "" end
	print(tab .. "{" )
	tab = tab .. "\t"
	for i, k in ipairs(tmp) do
		if type(t[k]) == "table" then
			print(tab.. tostring(k) .. "=" )
			Sort(t[k], tab)
		else
			print(tab .. tostring(k) .. "=" .. tostring(t[k]) .. "," )
		end
	end
	print(tab .. "},")
end


if not arg or not arg[1] then
	os.exit()
end

Include(arg[1])

Sort(CombatLogScribeDB)
