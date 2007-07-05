local frame

local ArenaVendor = {}

function ArenaVendor:OnLoad()
	self.hooks = {}
	frame = CreateFrame('Frame')
	frame:SetScript('OnEvent', function(frame,event,...) self[event](self,...) end)
	frame:RegisterEvent('MERCHANT_SHOW')
	frame:RegisterEvent('MERCHANT_CLOSED')
end


function ArenaVendor:MERCHANT_SHOW()
	if UnitName('target') == "Vixton Pinchwhistle" then
		ChatFrame1:AddMessage("WARNING: This is the season 1 vendor!", 1, 0, 0)
		self:Hook('BuyMerchantItem')
	end
end

function ArenaVendor:MERCHANT_CLOSED()
	self:Unhook('BuyMerchantItem')
end


function ArenaVendor:Hook(functionName)
	if not self.hooks[functionName] then
		self.hooks[functionName] = _G[functionName]
		_G[functionName] = self[functionName]
	end
end

function ArenaVendor:Unhook(functionName)
	if self.hooks[functionName] then
		_G[functionName] = self.hooks[functionName]
		self.hooks[functionName] = nil
	end
end

function ArenaVendor:BuyMerchantItem()
	ChatFrame1:AddMessage("WTF you want to waste your arena point on the season 1 vendor?!")
end


ArenaVendor:OnLoad()

