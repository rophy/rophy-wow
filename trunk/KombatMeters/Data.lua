
local addonID = "KombatMeters"
local Data = DongleStub("Dongle-1.0"):New(addonID)
local parser = ParserLib:GetInstance("1.1")


local data

function Data:Enable()
	self.db = self:InitializeDB("KombatMetersData", {
		profile = {
			showType = "dmgDone",
			onlyRaid = true,
			mergePet = false,
		}
	} )
	
	if not KombatMetersDataPerChar then
		KombatMetersDataPerChar = {}
	end
	data = KombatMetersDataPerChar
	self.data = data
	self.cmd = self:InitializeSlashCommand("KombatMeters Slash Command", "KOMBATMETERS", "kombatmeters", "km")
	self.cmd:InjectDBCommands(self.db, "copy", "delete", "list", "reset", "set")
	self.cmd:RegisterSlashHandler("Clears the data.", "clear", "ClearData")
	
	self:RegisterEvent("PLAYER_REGEN_DISABLED")
	self:RegisterEvent("PLAYER_REGEN_ENABLED")
	parser:RegisterInfoType(addonID, "hit", function(infoType, info, event) self:OnHitOrHeal(infoType, info, event) end)
	parser:RegisterInfoType(addonID, "heal", function(infoType, info, event) self:OnHitOrHeal(infoType, info, event) end)
end

function Data:ClearData()
	for k in pairs(data) do
		data[k] = nil
	end
	self.display:Refresh()
end

function Data:PLAYER_REGEN_DISABLED()

end

function Data:PLAYER_REGEN_ENABLED()

end

function Data:OnHitOrHeal(infoType, info, event)
	local name, valueType
	name = info.source
	if name and name ~= ParserLib_NONE and info.amount then
		if name == ParserLib_SELF then
			name = UnitName("player")
		end
		if not self.db.profile.onlyRaid or RaidUnits:GetUnitID(name) then
			if infoType == "hit" then
				valueType = "dmgDone"
			else
				valueType = "healDone"
			end
			self:AddValue(valueType,name,info.amount)
		end
	end
	name = info.victim
	if name and name ~= ParserLib_NONE and info.amount then
		if name == ParserLib_SELF then
			name = UnitName("player")
		end
		if not self.db.profile.onlyRaid or RaidUnits:GetUnitID(name) then
			if infoType == "hit" then
				valueType = "dmgTaken"
			else
				valueType = "healTaken"
			end
			self:AddValue(valueType,name,info.amount)
		end
	end
end

function Data:AddValue(valueType, name, amount)
	if not data[valueType] then
		data[valueType] = {}
	end
	if not data[valueType][name] then
		data[valueType][name] = 0
	end
	data[valueType][name] = data[valueType][name] + amount
	self.display:Refresh()
end




KombatMeters = Data


