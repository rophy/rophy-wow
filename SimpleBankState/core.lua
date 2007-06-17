
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

function core:Enable()
	self:StartDebugging()
end

function core:StartDebugging(level)
	if not level then
		level = 2 
	end
	for name, obj in self:IterateModules() do
		core.StartDebugging(obj,level)
	end
	self:Print("Started debugging")
	self:EnableDebug(level)
end

function core:StopDebugging()
	for name, obj in self:IterateModules() do
		core.StopDebugging(obj)
	end
	self:Print("Stopped debugging")
	self:EnableDebug(-1)
end

_G["SimpleBankState"] = core