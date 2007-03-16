local oldStrings = {}
local FixString

if GetLocale() == "deDE" then
	function FixString(str)
		--problematic strings
		-- %ss 
		-- a string capture directly followd by a letter followed by a space
		return string.gsub(str, "(%%%d?$?s)(%a%s)", "%1%'%2");
	end
elseif GetLocale() == "frFR" then
	function FixString(str)
		-- de is the main seperator
		local tmpStr = string.gsub(str, "(%%%d?$?s) de (%%%d?$?s)", "%1 DE %2");
		return string.gsub(tmpStr, "|2", "DE");
	end
elseif GetLocale() == "zhCN" or GetLocale() == "zhTW then
	function FixString(str)
		-- jinsongzhao
		if string.find(str,"的%%s") or string.find(str,"对%%s") or string.find(str,"击中%%s") or string.find(str,"對%%s") or string.find(str,"擊中%%s") then
			str = string.gsub(str, "(%%%d?$?s)([^%s+].)", "%1 %2");
			str = string.gsub(str, "(.[^%s+])(%%%d?$?s)", "%1 %2");
			str = string.gsub(str, "(.[^%s+])(%%%d?$?d)", "%1 %2");
			return string.gsub(str, "(%%%d?$?d)([^%s+].)", "%1 %2");
		end
		return str;
	end
elseif GetLocale() == "enUS": then
	function FixString(str)
		--problematic strings
		-- %s's 
		--Twilight's Hammer Ambassador's Flame Shock hits you for 1234 fire damage.
		-- or fictional: Twilight's Hammer Ambassador's Nature's Grasp ...
		return string.gsub(str, "(%%%d?$?s)('s)", "%1% %2");
	end
else
	function FixString(str)
		return str
	end
end


-- Input: name of the GlobalString, e.g. PERIODICAURADAMAGESELFSELF
-- Return: true if it is fixed, false if it has already been previously fixed.
function FixGlobalString(name)
	if not oldStrings[name] then
		local oldString = _G[name]
		if type(oldString) == "string" then
			oldStrings[name] = oldString
			_G[name] = FixString(oldString)
			return true
		end
	end
	return false
end

