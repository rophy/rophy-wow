local _G = getfenv(0)


local donothing = function() end
function CreateFrame(kind, name, parent)
	local frame = {
		SetScript = donothing,
		RegisterEvent = donothing,
		UnregisterEvent = donothing,
		Show = donothing,
		Hide = donothing,
	}
	if name then
		_G[name] = frame
	end
	return frame
end

function UnitName(unit)
	return unit
end

function GetRealmName()
	return "Realm Name"
end

function UnitClass(unit)
	return "Warrior", "WARRIOR"
end

function UnitHealthMax()
	return 100
end

function UnitHealth()
	return 50
end

function GetNumRaidMembers()
	return 1
end

function GetNumPartyMembers()
	return 1
end

FACTION_HORDE = "Horde"
FACTION_ALLIANCE = "Alliance"

function UnitFactionGroup(unit)
	return "Horde", "Horde"
end

function UnitRace(unit)
	return "Undead", "Scourge"
end

function GetTime()
	return os.clock()
end

function IsAddOnLoaded() return nil end

SlashCmdList = {}

function __WOW_Input(text)
	local a,b = string.find(text, "^/%w+")
	local arg, text = string.sub(text, a,b), string.sub(text, b + 2)
	for k,handler in pairs(SlashCmdList) do
		local i = 0
		while true do
			i = i + 1
			if not _G["SLASH_" .. k .. i] then
				break
			elseif _G["SLASH_" .. k .. i] == arg then
				handler(text)
				return
			end
		end
	end;
	print("No command found:", text)
end

DEFAULT_CHAT_FRAME = {
	AddMessage = function(self, text)
		print((string.gsub(text, "|c%x%x%x%x%x%x%x%x(.-)|r", "%1")))
	end
}

ChatFrame1 = DEFAULT_CHAT_FRAME

debugstack = debug.traceback
date = os.date

function GetLocale()
	return "enUS"
end

function GetAddOnInfo()
	return
end

function GetNumAddOns()
	return 0
end

function getglobal(k)
	return _G[k]
end

function setglobal(k, v)
	_G[k] = v
end

function geterrorhandler() 
	return error
end

function InCombatLockdown()
	return false
end

time = os.clock

RED_FONT_COLOR_CODE = ""
GREEN_FONT_COLOR_CODE = ""


StaticPopupDialogs = {}
