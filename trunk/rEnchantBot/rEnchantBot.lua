local rEB = {}
local frame

rEB.SlashParser = function(cmd)
	if cmd == 'scan' then
		rEB:ScanEnchants()
	elseif cmd == 'off' then
		frame:UnregisterEvent("CHAT_MSG_WHISPER")
		ChatFrame1:AddMessage("rEnchantBot is |cffff3333disabled|r.")
	elseif cmd == 'on' then
		frame:RegisterEvent("CHAT_MSG_WHISPER")
			ChatFrame1:AddMessage("rEnchantBot is |cff3333ffenabled|r.")
	else
		ChatFrame1:AddMessage("/reb {scan|off|on}")
	end
end

function rEB:OnLoad()
	frame = CreateFrame("Frame")
	frame:SetScript("OnEvent", function(frame,event,...) self[event](self,...) end)
	frame:RegisterEvent("VARIABLES_LOADED")
	frame:RegisterEvent("CHAT_MSG_WHISPER")
	SLASH_RENCHBOT1 = "/reb";
	SlashCmdList["RENCHBOT"] = self.SlashParser
end

function rEB:VARIABLES_LOADED()
	if not _G["rEnchantBotDB"] then
		_G["rEnchantBotDB"] = {}
	end
	self.db = _G["rEnchantBotDB"]
end

local function recycle(t)
	for k in pairs(t) do
		t[k] = nil
	end
	return t
end

local function collectReturns(t,...)
	for i=1, select('#',...) do
		t[i] = select(i,...)
	end
	return t
end

do
	local keywords = {}
	local results = {}
	function rEB:CHAT_MSG_WHISPER(msg,playerName)
		if msg:match("^!ench") then
			local searchString = msg:sub(7)
			if searchString == "" then
				SendChatMessage("Syntax: !ench <search string>", "WHISPER", nil, playerName)
			else
				recycle(keywords)
				recycle(results)
				keywords = collectReturns(keywords,string.split(" ", searchString))
				self:SearchEnchants(keywords, results)
				self:SendResults(results, "WHISPER", playerName)
			end
		end
	end
end

function rEB:SendResults(results, chatType, channel)
	if #results > 0 then
		for i, link in ipairs(results) do
			SendChatMessage(link, chatType, nil, channel)
		end
	else
		SendChatMessage("Nothing found, try search with different keywords?", chatType, nil, channel)
	end
end

function rEB:SearchEnchants(keywords, results)
	local enchants = self.db.enchants
	if not enchants then
		return
	end
	for i, enchantInfo in ipairs(enchants) do
		local name,desc,link = unpack(enchantInfo)
		local match = true
		for j, keyword in ipairs(keywords) do
			if not ( name and name:lower():match(keyword:lower()) )
			and not ( desc and desc:lower():match(keyword:lower()) ) then
				match = false
				break
			end
		end
		if match then
			table.insert(results,link)
		end
	end
end

function rEB:ScanEnchants()
	local numEnchants = GetNumCrafts()
	if numEnchants < 1 then
		ChatFrame1:AddMessage("Cannot find any enchant, make sure the enchanting frame is opened.")
		return false
	end
	local enchants = {}
	self.db.enchants = enchants
	for i=1, numEnchants do
		local craftName, _, craftType = GetCraftInfo(i)
		local craftDescription = GetCraftDescription(i)
		local craftLink = GetCraftItemLink(i)
		if craftType ~= "header" then
			table.insert(enchants, {craftName, craftDescription, craftLink})
		end
	end
	ChatFrame1:AddMessage("Found "..numEnchants.." enchants.")
end

rEB:OnLoad()
