assert(ParserLib, "ParserLib not found!")
assert(DongleStub, "DongleStub not found!")


local L = {
	["Enslave Demon"] = "Enslave Demon",
}

local parser = ParserLib:GetInstance("1.1")
local candy = AceLibrary("CandyBar-2.0")
local paint = AceLibrary("PaintChips-2.0")

local addonName = "WarlockCC"
local enslaveCandy = addonName.."_EnslaveDemon"


local lockCC = DongleStub("Dongle-1.0"):New(addonName)

function lockCC:Enable()
	self:RegisterEvent("UNIT_AURA")
	self:RegisterEvent("UNIT_PET")
end

function lockCC:LazyInitialize()

	-- Registers the color I need.
	paint:RegisterColor("enslavepurple", "CC00CC")
	
	-- Registers a group.
	candy:RegisterCandyBarGroup(addonName)
	candy:SetCandyBarGroupPoint(addonName,"TOPRIGHT", "UIParent", "TOPRIGHT", -120, -180)
	
	-- Registers the candies.
	candy:RegisterCandyBar(enslaveCandy, 300, nil, "Interface\\Icons\\Spell_Shadow_EnslaveDemon", "enslavepurple")
	candy:SetCandyBarWidth(enslaveCandy, 150)
	candy:SetCandyBarOnClick(enslaveCandy, function(c,b,s)
		if b == "LeftButton" then
			self:ReportTimer(c,s)
		end
	end, L["Enslave Demon"])
	candy:RegisterCandyBarWithGroup(enslaveCandy,addonName)
	
end

function lockCC:UNIT_AURA(event,unit)
	self:Debug(1,event,unit)
	if unit == "pet" then
		self:CheckEnslave()
	end
end

function lockCC:UNIT_PET(event,unit)
	self:Debug(1,event,unit)
	if unit == "player" then
		self:CheckEnslave()
	end
end


function lockCC:ReportTimer(candyName,spellName)
	self:Print(spellName,candyName)
	local registered,timeTotal,timeElapsed,running = candy:CandyBarStatus(candyName)
	if timeTotal and timeElapsed then
		local timeLeft = timeTotal - timeElapsed
		local msg = string.format("My %s will fade in %d seconds.", spellName, timeLeft)
		SendChatMessage(msg, "SAY")
	end
end

function lockCC:CheckEnslave()
	if UnitExists("pet") then
		self:Debug(1,"You have a pet.")
		if self:HasDebuff("pet",L["Enslave Demon"]) then
			if not self.alreadyEnslaved then
				self:StartTimer(L["Enslave Demon"], 300)
				self.alreadyEnslaved = true
			else
				self:Debug(1,"Already Enslaved")
			end
		else
			self:Debug(1,"Cannot find Enslave Demon!")
			self.alreadyEnslaved = false
			self:StopTimer()
		end
	else
		self:Debug(1,"Pet doesn't exists.")
		if self.alreadyEnslaved then
--			self:PrintF("Enslave gone after %d seconds.", GetTime() - self.timer)
		end
		self.alreadyEnslaved = false
		self:StopTimer()
	end
end

function lockCC:StartTimer(spell,duration)
	if not self.lazyInitialized then
		self:LazyInitialize()
		self.lazyInitialized = true
	end
	candy:SetCandyBarText(enslaveCandy,UnitName("pet"))
	candy:StartCandyBar(enslaveCandy)
end

function lockCC:StopTimer()
	if candy:IsCandyBarRegistered(enslaveCandy) then
		candy:StopCandyBar(enslaveCandy)
	end
end

function lockCC:PrintTimer()
	if not self.alreadyEnslaved then
		self:Print("No enslaved pet.")
	else
		self:PrintF("The pet has been enslaved for %d seconds.", GetTime() - self.timer )
	end
end

function lockCC:HasDebuff(unit, spell)
	local i = 1
	local debuff = UnitDebuff(unit,i)
	while debuff do
		if debuff:find(spell,1,true) then
			return i
		else
			i = i + 1
			debuff = UnitDebuff(unit,i)
		end
	end
end

WarlockCC = lockCC

