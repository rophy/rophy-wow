local frame
local OnLoad
local OnEvent
local OnUpdate
local global = {}
local pollutes = {}
local DELAY_TIME = 5


function OnLoad()
	local timer = GetTime()
	for k, v in pairs(_G) do
		global[k] = true
	end
	timer = GetTime() - timer
	frame = CreateFrame("Frame")
	frame:Hide()
	frame:SetScript("OnEvent", OnEvent)
	frame:SetScript("OnUpdate", OnUpdate)
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	frame.remainTime = DELAY_TIME
	ChatFrame1:AddMessage("GlobalScan: took " .. timer .. "ms for the initial scan.")
end

function OnEvent()
	ChatFrame1:AddMessage("GlobalScan: will scan for pullution after " .. DELAY_TIME .. " seconds.")
	frame:UnregisterAllEvents()
	frame:Show()
end

function OnUpdate(frame, elapsed)
	frame.remainTime = frame.remainTime - elapsed
	if frame.remainTime < 0 then
		RescanPollution()
		frame:Hide()
	end
end

function UpdateGlobal()
	for i,k in pairs(pollutes) do
		global[k] = true
		pollutes[i] = nil
	end
end

function RescanPollution()
	ChatFrame1:AddMessage("GlobalScan: Scanning for global pollution...")
	for k in pairs(_G) do
		if not global[k] then
			table.insert(pollutes,k)
		end
	end
	ChatFrame1:AddMessage("GlobalScan: type /script PrintResult() to see the results")
end

function PrintResult()
	for i, key in ipairs(pollutes) do
		ChatFrame1:AddMessage(key)
	end
end


OnLoad()