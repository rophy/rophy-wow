
local core = DongleStub("Dongle-1.1"):New("SimpleBankState")

local L = setmetatable({}, {
	__index = function(t,k) 
		--return k end	-- Use this when I still haven't externalize the strings.
		error(string.format("Locale '%s' does not exist", tostring(k))) -- Use this after.
	end 
})


function core:UpdateLocales(loc)
	for k, v in pairs(loc) do
		if v == true then
			L[k] = k
		else
			L[k] = v
		end
	end
end

function core:GetLocale()
	return L
end

_G["SimpleBankState"] = core