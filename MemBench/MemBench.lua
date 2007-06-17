local frame
local text

local OnLoad
local OnUpdate
local ShowTooltip
local HideTooltip
local MemToText = function(mem)
	local unit
	if mem > 1024 then
		unit = "M"
		mem = mem / 1024
	else
		unit = "K"
	end
	return string.format("%.3f%s", mem, unit)
end

function OnLoad()
	frame = CreateFrame("Button")
	frame:SetWidth(140)
	frame:SetHeight(26)
	frame:SetPoint("CENTER", PlayerFrame, "CENTER", 50, 40)
	frame:SetToplevel(true)
	frame:SetMovable(true)
	frame:SetBackdrop({
		bgFile="Interface/Tooltips/UI-Tooltip-Background",
		edgeFile="Interface/Tooltips/UI-Tooltip-Border",
		tile="true",
		edgeSize = 16,
		tileSize = 16,
		insets = { left=5, right=5, top=5, bottom=5 }
	})
	text = frame:CreateFontString(nil, "BACKGROUND", "GameFontNormal")
	text:SetPoint("CENTER")
	text:SetText("MemBench")
	frame:RegisterForDrag("LeftButton")
	frame:SetScript("OnDragStart", function() frame:StartMoving() end)
	frame:SetScript("OnDragStop", function() frame:StopMovingOrSizing() end)
	frame:SetScript("OnUpdate", OnUpdate)
	frame:SetScript("OnEnter", ShowTooltip)
	frame:SetScript("OnLeave", HideTooltip)
	frame:SetScript("OnDoubleClick", function() collectgarbage() end)
	
end

local tick,mem1,mem2,mem3,mem4,mem5,mem6,mem7,mem8,mem9,mem10,memCurr,init

function OnUpdate(frame,diff)
	if not init then
		tick = 0
		memCurr = collectgarbage('count')
		mem1 = memCurr
		mem2 = memCurr
		mem3 = memCurr
		mem4 = memCurr
		mem5 = memCurr
		mem6 = memCurr
		mem7 = memCurr
		mem8 = memCurr
		mem9 = memCurr
		mem10 = memCurr
		init = true
	else
		tick = tick + diff
		if tick > 1 then
			tick = 0
			mem1, mem2, mem3, mem4, mem5, mem6, mem7, mem8, mem9, mem10 =
				memCurr, mem1, mem2, mem3, mem4, mem5, mem6, mem7, mem8, mem9
			memCurr = collectgarbage('count')
			if mem1 > memCurr then
				mem1, mem2, mem3, mem4, mem5, mem6, mem7, mem8, mem9, mem10 =
					memCurr, memCurr, memCurr, memCurr, memCurr, memCurr, memCurr, memCurr, memCurr, memCurr
			end
			text:SetText( string.format("%s, %.1fK/s",MemToText(memCurr), (memCurr - mem10) / 10   ) );
		end
	end
end

local SHOW_SIZE = 10
local function sorter(a,b)
	return a.mem > b.mem
end
local addonInfos = {}
function ShowTooltip()
	GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
	
	local numAddons = GetNumAddOns()
	for i=1, numAddons do
		local info = addonInfos[i] or {}
		info.name = GetAddOnInfo(i)
		info.mem = GetAddOnMemoryUsage(i)
		addonInfos[i] = info
	end
	table.sort(addonInfos, sorter)
	
	GameTooltip:AddDoubleLine("Addon", "Memory")
	for i=1, SHOW_SIZE do
		GameTooltip:AddDoubleLine(addonInfos[i].name, MemToText(addonInfos[i].mem), 1,1,1,1,1,1)
	end
	GameTooltip:AddLine("\nDouble click to force a garbage collection")
	GameTooltip:Show()
end

function HideTooltip()
	GameTooltip:Hide()
end


OnLoad()
