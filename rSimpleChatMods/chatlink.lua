scmChatlink = {}

-- System channel names.
local	STR_GENERAL = "General -"
local	STR_TRADE = "Trade -"
local	STR_LFG = "LookingForGroup -"
local	STR_LOCALDEF = "LocalDefense -"
local	STR_WORLDDEF = "WorldDefense"
local	STR_GUILDREC = "GuildRecruitment - "


-- GERMAN LANGUAGE STRINGS.
if (GetLocale() == "deDE") then
	STR_GENERAL = "Allgemein -"
	STR_TRADE = "Handel -"
	STR_LFG = "SucheNachGruppe -"
	STR_LOCALDEF = "LokaleVerteidigung -"
	STR_WORLDDEF = "WeltVerteidigung"
	STR_GUILDREC = "Gildenrekrutierung - "
end


-- FRENCH LANGUAGE STRINGS.
if (GetLocale() == "frFR") then
	STR_GENERAL = "G\195\169n\195\169ral -"
	STR_TRADE = "Commerce -"
	STR_LFG = "RechercheGroupe -"
	STR_LOCALDEF = "D\195\169fenseLocale -"
	STR_WORLDDEF = "D\195\169fenseUniverselle"
	STR_GUILDREC = "RecrutementDeGuilde - "
end



function scmChatlink:Enable()

	local scmAddMessage = function(frame, text, r, g, b, id)
		self:AddMessage(frame, text, r, g, b, id)
	end
	
	local scmSendChatMessage = function(msg, chatType, language, channel)
		self:SendChatMessage(msg, chatType, language, channel)
	end

	local frame

	-- On first enble, save the reference to the original functions.
	if not self.hooks then
		self.hooks = {}
		for i = 1, 7 do
			frame = _G["ChatFrame" .. i]
			self.hooks[frame] = frame.AddMessage
		end
		self.hooks["SendChatMessage"] = SendChatMessage
	end
	
	-- Hook the functions.
	for i = 1, 7 do
		frame = _G["ChatFrame" .. i]
		frame.AddMessage = scmAddMessage
	end
	SendChatMessage = scmSendChatMessage

end

function scmChatlink:Disable()
	for i = 1, 7 do
		local frame = _G["ChatFrame"..i]
		frame.AddMessage = self.hooks[frame]
	end
	SendChatMessage = self.hooks.SendChatMessage
end


function scmChatlink:AddMessage(frame, text, r, g, b, id)
	text = scmChatlink:Decompose(text)
	return self.hooks[frame](frame, text, r, g, b, id)
end

-- Turn CLINKs into normal item and enchant links.
function scmChatlink:Decompose (chatstring)
	if chatstring then
		chatstring = string.gsub (chatstring, "{CLINK:item:(%x+):(%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-):([^}]-)}", "|c%1|Hitem:%2|h[%3]|h|r")
		chatstring = string.gsub (chatstring, "{CLINK:enchant:(%x+):(%d-):([^}]-)}", "|c%1|Henchant:%2|h[%3]|h|r")
		-- For backward compatibility (yeah, I should have done it before...).
		chatstring = string.gsub (chatstring, "{CLINK:(%x+):(%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-):([^}]-)}", "|c%1|Hitem:%2|h[%3]|h|r")

		-- Forward compatibility, for future clink structure changes.
		chatstring = string.gsub (chatstring, "{CLINK(%d):%[?([^:}%]]-)%]?:([^:}]-)[^}]-}", "%2")
	end
	return chatstring
end



-- Turn item and enchant links into CLINKs.
function scmChatlink:Compose (chatstring)
	if chatstring then
--		1.10 item links: to possibly be reactivated in a future version.
--		chatstring = string.gsub (chatstring, "|c(%x+)|H(item):(%d-):(%d-):(%d-):(%d-)|h%[([^%]]-)%]|h|r", "{CLINK:%2:%1:%3:%4:%5:%6:%7}")
--		Old item links: backward compatibility.
		chatstring = string.gsub (chatstring, "|c(%x+)|Hitem:(%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-)|h%[([^%]]-)%]|h|r", "{CLINK:%1:%2:%3}")
		chatstring = string.gsub (chatstring, "|c(%x+)|H(enchant):(%d-)|h%[([^%]]-)%]|h|r", "{CLINK:%2:%1:%3:%4}")
	end
	return chatstring
end


-- Translate item links into CLINKs on outgoing non-system channel messages.
function scmChatlink:SendChatMessage (msg, chatType, language, channel)

	if chatType == "CHANNEL" then
		local chan_num, chan_name = GetChannelName (channel)
		if chan_name and
		not chan_name:find(STR_GENERAL, 1, true) and
		not chan_name:find(STR_TRADE, 1, true) and
		not chan_name:find(STR_LFG, 1, true) and
		not chan_name:find(STR_LOCALDEF, 1, true) and
		not chan_name:find(STR_WORLDDEF, 1, true) and
		not chan_name:find(STR_GUILDREC, 1, true) then
			msg = self:Compose (msg)
		end
	end

	-- Pass along to original function.
	self.hooks.SendChatMessage (msg, chatType, language, channel)
end

scmChatlink:Enable()
