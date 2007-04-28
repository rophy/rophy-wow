local moduleName = "BarDisplay"
local core = KombatMeters
local bars = {}
local BAR_WIDTH = 130
local BAR_HEIGHT = 16
local BAR_COUNT = 5
local frame
local barOffset = 0
local db
local timeToNextUpdate = 0

BarDisplay = core:NewModule(moduleName)

local StatusBar_OnEnter
local StatusBar_OnLeave
local Frame_OnMouseWheel
local Frame_OnUpdate

function BarDisplay:Enable()
	db = core.db:RegisterNamespace(moduleName)
	
	db:RegisterDefaults({
		["profile"] = {
			barsize = 5,
			shown = 'DamageDone',
			refresh = 5
		}
	} )

	self:CreateFrame()
	self.bars = bars

	self:RegisterMessage("KombatMeters_Data_Cleared", "OnDataCleared")
	
	self:Refresh()
	
end

function BarDisplay:OnDataCleared()
	barOffset = 0
	self:Refresh()
end

function BarDisplay:CreateFrame()
	local bgColor = {1,0,0}
	local backdrop = {
		bgFile="Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile="Interface\\Tooltips\\UI-Tooltip-Border",
		tile=true,
		tileSize=16,
		edgeSize=16,
		insets = { left=5, right=4, top=5, bottom=5 },
	}
	frame = CreateFrame("Frame")
	frame:SetWidth(BAR_WIDTH)
	frame:SetHeight( db.profile.barsize * BAR_HEIGHT + 12)
	frame:SetMovable(true)
	frame:SetPoint("CENTER", nil, "CENTER", 100, 0)
	frame:SetBackdrop(backdrop)
	frame:SetBackdropColor(unpack(bgColor))
	frame:EnableMouseWheel(1)
	frame:SetScript("OnMouseWheel", Frame_OnMouseWheel)
	frame:SetScript("OnUpdate", Frame_OnUpdate)
	frame:Show()
	
	local titleFrame = CreateFrame("Button", nil, frame)
	titleFrame:SetWidth(BAR_WIDTH-10)
	titleFrame:SetHeight(24)
	titleFrame:SetPoint("BOTTOM", frame, "TOP", 0, -3)
	titleFrame:SetBackdrop(backdrop)
	titleFrame:SetBackdropColor(unpack(bgColor))
	titleFrame:EnableMouse(true)
	titleFrame:RegisterForDrag("LeftButton")
	titleFrame:SetScript("OnDragStart", function() frame:StartMoving() end)
	titleFrame:SetScript("OnDragStop", function() frame:StopMovingOrSizing() end)
	titleFrame:SetScript("OnClick", function() self:SetToNextShownValueType() end)
	local title = titleFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	title:SetAllPoints(titleFrame)
	frame.title = title

	self.frame = frame
end

function BarDisplay:SetToNextShownValueType()
	local dataTable = core:GetDataTable()
	local shownValueType = db.profile.shown
	if not dataTable then
		return
	end
	if not dataTable[shownValueType] then
		shownValueType = next(dataTable)
	else
		shownValueType = next(dataTable, shownValueType)
	end
	if not shownValueType then
		shownValueType = next(dataTable)
	end
	if shownValueType then
		db.profile.shown = shownValueType
	end
	self:Refresh()
end

function BarDisplay:SetBarSize(size)
	db.profile.barsize = size
	local currSize = #bars
	for i=1, size-currSize do
		self:AddBar()
	end
	for i=1, size do
		bars[i]:Show()
	end
	for i=size+1, currSize do
		bars[i]:Hide()
	end
end

function BarDisplay:GetBarSize()
	return db.profile.barsize
end

function BarDisplay:Refresh()
	local shownValue = db.profile.shown
	if not shownValue then
		return
	end
	
	frame.title:SetText(shownValue)
	
	local index = core:GetSortedDataIndexes(shownValue)
	local data = core:GetDataTable(shownValue)
	if not index or not data then
		return 
	end
	
	local dataSize = #index
	for i=dataSize+1, #bars do
		bars[i]:Hide()
	end
	local maxValue = index[1] and data[index[1]]
	
	local count = db.profile.barsize
	if #index < count then
		count = #index
	end
	for i=1, count do
		local name = index[i+barOffset]
		local value = data[name]
		if not bars[i] then
			bars[i] = self:CreateBar()
		end
		local bar = bars[i]
		bar:SetMinMaxValues(0,maxValue)
		bar:SetValue(value)
		bar.text:SetText(name)
		bar:Show()
		bar.name = name
		bar.value = value
	end
end


-- Add a bar to the bottom of frame
function BarDisplay:CreateBar()
	local bar = CreateFrame("StatusBar", nil, frame)
	bar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
	bar:SetStatusBarColor(0,1,0)
	bar:SetHeight(BAR_HEIGHT)
	bar:EnableMouse(true)
	bar:SetScript("OnEnter", StatusBar_OnEnter)
	bar:SetScript("OnLeave", StatusBar_OnLeave)
	if #bars == 0 then
		bar:SetPoint("TOPLEFT", frame, "TOPLEFT", 6, -6)
		bar:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -6, -6)
	else
		local bottomBar = bars[#bars]
		bar:SetPoint("TOPLEFT", bottomBar, "BOTTOMLEFT")
		bar:SetPoint("TOPRIGHT", bottomBar, "BOTTOMRIGHT")
	end
	
	-- Text FontString.
	local fontString = bar:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	fontString:SetAllPoints(bar)
	bar.text = fontString
	
	return bar
end

function Frame_OnUpdate(frame,eclapsed)
	timeToNextUpdate = timeToNextUpdate + eclapsed
	if timeToNextUpdate > db.profile.refresh then
		timeToNextUpdate = 0
		BarDisplay:Refresh()
	end
end



function Frame_OnMouseWheel(frame,arg1)
	local data = core:GetSortedDataIndexes(db.profile.shown)
	if not data then return end
	local size = #data
	if size > db.profile.barsize then
		if arg1 == 1 and barOffset > 0 then
			barOffset = barOffset - 1
		elseif arg1 == -1 and barOffset + db.profile.barsize < size then
			barOffset = barOffset + 1
		end
	end
	BarDisplay:Refresh()
end


function StatusBar_OnEnter()
	GameTooltip:SetOwner(this, "ANCHOR_CURSOR")
	GameTooltip:AddDoubleLine(this.name or "None", this.value or 0, 0, 1, 0, 1, 1, 0)
	local valueType = db.profile.shown
	local skillData = core:GetSkillData(valueType, this.name)
	local total = 0
	if skillData then
		for skill, value in pairs(skillData) do
			GameTooltip:AddDoubleLine(skill,value, 0, 0, 1, 1, 1, 0)
			total = total + value
		end
		if total ~= this.value then
			local msg = string.format("Warning: skill total %d does not match expected value %d.", total, this.value)
			GameTooltip:AddLine(msg)
		end
	end
	GameTooltip:Show()
end

function StatusBar_OnLeave()
	GameTooltip:Hide()
end
