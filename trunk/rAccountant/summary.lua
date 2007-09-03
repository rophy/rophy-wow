 --[[
	summary.lua : summary report from the transactions.
	
	Sums by character, category, date (daily, weekly, monthly, yearly, custom)
	
	Category Summary
		example:
			Category    Income      Expense      Overall
			Loot                4000                 0           4000
			Merchant      50000         3000         47000
			Mail                       0             400            -400
			Repair                    0         10000        -10000
			Total              54000        13400         40600
			
	Character Summary
		example:
			Character       Income       Expense        Overall
			Rophy               10000            5000            5000
			Ballis                  4000          10000           -6000
			Total                 14000          15000            -1000
			

]]
local transaction = Transaction
local L = setmetatable({}, {__index=function(t,k) return k end})
if not transaction then return end


local server = transaction:GetCurrentServerName()




--[[ Utility Functions ]]--

-- From Abacus-2.0
local FormatMoney
do
	local inf = 1/0
	local COLOR_WHITE = "ffffff"
	local COLOR_GREEN = "00ff00"
	local COLOR_RED = "ff0000"
	local COLOR_COPPER = "eda55f"
	local COLOR_SILVER = "c7c7cf"
	local COLOR_GOLD = "ffd700"
	function FormatMoney(value)
		local negl = ""
		local negr = ""
		if value < 0 then
			negl = "|cffff0000-(|r"
			negr = "|cffff0000)|r"
		end
		local gold = floor(math.abs(value) / 10000)
		local silver = mod(floor(math.abs(value) / 100), 100)
		local copper = mod(floor(math.abs(value)), 100)
		if value == inf or value == -inf then
			return format("%s|cff%s%s|r%s", negl, COLOR_COPPER, math.abs(value), negr)
		elseif value ~= value then
			return format("|cff%s0|r", COLOR_COPPER)
		elseif gold ~= 0 then
			return format("%s|cff%s%d|r.|cff%s%02d|r.|cff%s%02d|r%s", negl, COLOR_GOLD, gold, COLOR_SILVER, silver, COLOR_COPPER, copper, negr)
		elseif silver ~= 0 then
			return format("%s|cff%s%d|r.|cff%s%02d|r%s", negl, COLOR_SILVER, silver, COLOR_COPPER, copper, negr)
		else
			return format("%s|cff%s%d|r%s", negl, COLOR_COPPER, copper, negr)
		end
	end
end

--------------------
-- Mini-Compost --
--------------------
local cache = setmetatable({}, {__mode='k'})
local function acquire(...)
	local t = next(cache)
	if t then cache[t] = nil else t = {} end
	for i=1, select('#',...) do
		local arg = select(i,...)
		table.insert(t, arg )
	end
	return t
end
local function reclaim(t, depth)
	for k, v in pairs(t) do
		if depth and depth > 1 and type(v) == 'table' then
			reclaim(v, depth-1)
		end
		t[k] = nil	
	end
	cache[t] = true
end

--[[ View ]]--

local View = {
	methods = { "CreateHeaderRow", "CreateRow", "SetText", "GetRowCount" }
}

function View:New()
	local newView = {}
	for i, method in ipairs(self.methods) do
		newView[method] = self[method]
	end
	self.CreateViewFrame(newView)
	return newView
end

function View:CreateViewFrame()
	if not self.frame then
		
		-- Create the main frame.
		local viewFrame = CreateFrame("Frame", 'rAccountantViewFrame')
		self.frame = viewFrame
		viewFrame:SetWidth(485)
		viewFrame:SetHeight(485)
		viewFrame:SetPoint("CENTER")
		viewFrame:SetClampedToScreen(true)
		viewFrame:SetBackdrop({
			bgFile="Interface/DialogFrame/UI-DialogBox-Background",
			edgeFile="Interface/DialogFrame/UI-DialogBox-Border",
			tile=true,
			tileSize=32,
			edgeSize=32,
			insets = { left=11, right=12, top=12, bottom=11 },
		})
		viewFrame:SetMovable(true)
		
		local frame, fontString, texture
		
		-- Header frame.
		frame = CreateFrame("Frame", nil, viewFrame, "OptionFrameBoxTemplate")
		self.headerFrame = frame
		frame:SetWidth(365)
		frame:SetHeight(30)
		frame:SetPoint("BOTTOM", viewFrame, "TOP", 0, -5)
		frame:SetBackdropColor(0.4, 0.4, 0.4)
		frame:SetToplevel(false)
		frame:EnableMouse(true)
		frame:RegisterForDrag("LeftButton")
		frame:SetScript("OnDragStart", function(this) viewFrame:StartMoving() end)
		frame:SetScript("OnDragStop", function(this) viewFrame:StopMovingOrSizing() end)
		fontString = frame:CreateFontString(nil, "BACKGROUND", "GameFontNormal")
		fontString:SetPoint("CENTER")
		local title = string.format("rAccountant")
		fontString:SetText(title)
		
		-- Summary Type Header
		frame = CreateFrame("Button", nil, viewFrame)
		frame:SetWidth(140)
		frame:SetHeight(24)
		frame:SetPoint("TOP", viewFrame, "TOP", 0, -10)
		frame:SetFontString(frame:CreateFontString(nil, "BACKGROUND", "GameFontNormal"))
		frame:SetText("HELLO")
		self.reportTitle = frame
		
		-- Close Button.
		frame = CreateFrame("Button", nil, viewFrame, "UIPanelCloseButton")
		frame:SetFrameLevel(self.headerFrame:GetFrameLevel()+2)
		self.closeButton = frame
		frame:SetPoint("CENTER", self.headerFrame, "RIGHT", -17, 0)
		
		-- Column List Button
		frame = CreateFrame("Button", nil, viewFrame, "UIPanelButtonTemplate")
		frame:SetPoint("TOPLEFT", viewFrame, "TOPLEFT", 14, -12)
		frame:SetWidth(24)
		frame:SetHeight(24)
		frame:SetText("F")
		frame:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		self.filterButton = frame
		
		self.rows = {}

		-- Refresh Button.
		frame = CreateFrame("Button", nil, viewFrame, "UIPanelButtonTemplate")
		frame:SetWidth(60)
		frame:SetHeight(20)
		frame:SetPoint("BOTTOMLEFT", viewFrame, "BOTTOMLEFT", 20, 20)
		frame:SetText(L["Refresh"])
		self.refreshButton = frame

		

	end
	return self.frame
end

function View:CreateHeaderRow(column, inherit, callback)
	if self.frame and not self.headers then
		self.headers = {}
		for i=1, column do
			local header = CreateFrame("Button", nil, self.frame, inherit)
			if callback then
				callback(i, header)
			end
			table.insert(self.headers, header)
		end
	end
	return self.headers
end

function View:CreateRow(callback)
	if self.headers then
		local currentRowSize = #self.rows
		local row = {}
		for i, header in ipairs(self.headers) do
			local fontString = header:CreateFontString(nil, "BACKGROUND", "GameFontHighlight")
			fontString:SetWidth(header:GetWidth())
			fontString:SetHeight(header:GetHeight())
			fontString:SetPoint('TOPLEFT', header, 'BOTTOMLEFT', 0, -currentRowSize*header:GetHeight())
			fontString:SetJustifyH('RIGHT')
			if callback then
				callback(i, fontString)
			end
			table.insert(row, fontString)
		end
		table.insert(self.rows,row)
		return row
	end
end

function View:GetRowCount()
	return #self.rows
end

function View:SetText(row, ...)
	if self.rows[row] then
		for i=1, select('#',...) do
			if self.rows[row][i] then
				self.rows[row][i]:SetText(select(i,...))
			end
		end
	end
end

--[[ Model ]]--
local PlayerModel = {
	data = {},
	filters = {}
}
function PlayerModel:GetSize()
	return #self.data
end
function PlayerModel:GetData(index)
	if self.data[index] then
		return unpack(self.data[index])
	end
end
function PlayerModel:ResetFilter()
	for k,v in pairs(transaction.categoryMap) do
		if type(k) == 'string' then
			self.filters[k] = false
		end
	end
end
function PlayerModel:SetSorter(which)
	if self.sortOrder == which or self.sortOder == -which then
		self.sortOrder = -which
	else
		self.sortOrder = which
	end
end
function PlayerModel:Sort()
	if self.sortOrder then
		local which = self.sortOrder
		table.sort(self.data, function(a,b)
			if which > 0 then
				return a[which] < b[which]
			else
				return a[-which] > b[-which]
			end
		end)
	end
end

function PlayerModel:Refresh()
	for k,v in pairs(self.data) do
		reclaim(v)
		self.data[k] = nil
	end
	local totalIncome, totalExpense = 0,0
	for player in transaction:IteratePlayers(server) do
		local income, expense = 0, 0
		local from, to = 1, transaction:GetSize(player,server) -- transaction:SearchByTime(beginTime, endTime, player, server)
		if from then
			ChatFrame1:AddMessage(from..","..to)
			for i=from, to do
				local _, amount, cat = transaction:GetData(i,player,server)
				if not self.filters[transaction.categoryMap[cat]] then	-- category filter.
					if amount > 0 then
						income = income + amount
					else
						expense = expense - amount
					end
				end
			end
		end
		table.insert(self.data, acquire(player,income,expense,income-expense))
		totalIncome = totalIncome + income
		totalExpense = totalExpense + expense
	end
	self:Sort()
	self.data.total = acquire(totalIncome, totalExpense, totalIncome-totalExpense)
end

local CategoryModel = {
	data = {},
	filters = {},
	GetSize = PlayerModel.GetSize,
	GetData = PlayerModel.GetData,
	Sort = PlayerModel.Sort,
	SetSorter = PlayerModel.SetSorter,
}
function CategoryModel:ResetFilter()
	for player in transaction:IteratePlayers(server) do
		self.filters[player] = false
	end
end
function CategoryModel:Refresh()
	for k,v in pairs(self.data) do
		reclaim(v)
		self.data[k] = nil
	end
	local cache = acquire()
	for player in transaction:IteratePlayers(server) do
		if not self.filters[player] then
			local income, expense = 0, 0
			local from, to = 1, transaction:GetSize(player,server) -- transaction:SearchByTime(beginTime, endTime, player, server)
			if from then
				for i=from, to do
					local _, amount, cat = transaction:GetData(i,player,server)
					if not cache[cat] then
						cache[cat] = { income=0, expense=0 }
					end
					if amount > 0 then
						cache[cat].income = cache[cat].income + amount
					else
						cache[cat].expense = cache[cat].expense - amount
					end
				end
			end
		end
	end
	local totalIncome, totalExpense = 0,0
	for cat, t in pairs(cache) do
		table.insert(self.data, acquire(transaction.categoryMap[cat],t.income,t.expense,t.income-t.expense))
		totalIncome = totalIncome + t.income
		totalExpense = totalExpense + t.expense
	end
	self:Sort()
	self.data.total = acquire(totalIncome, totalExpense, totalIncome-totalExpense)
	reclaim(cache)
end

--[[ Controller ]]--
local Report = {
	methods = { "ToggleType", "Refresh", "OnClickFilterButton", "OnClickReportHeader", "PopulateFilterMenu" }
}

function Report:New()
	local newReport = {}
	local view = View:New()
	newReport.view = view
	local settings = {
		anchor = { 'TOPLEFT', view.frame, 'TOPLEFT', 10, -50 },
		alignOffset = 10,
		height = 24,
	}
	view:CreateHeaderRow(4, nil, function(i,header)
		if i == 1 then
			header:SetPoint(unpack(settings.anchor))
		else
			header:SetPoint('TOPLEFT', view.headers[i-1], 'TOPRIGHT', settings.alignOffset, 0)
		end
		header:SetWidth(100)
		header:SetHeight(settings.height)
		header:SetFontString(header:CreateFontString(nil, 'BACKGROUND', 'GameFontNormal'))
		header:SetScript("OnClick", function(frame)
			newReport.model:SetSorter(i)
			newReport:Refresh()
		end)
	end)
	
	-- Script handlers.
	view.reportTitle:SetScript("OnClick", function(frame) newReport:OnClickReportHeader(frame) end)
	view.filterButton:SetScript("OnClick", function(frame) newReport:OnClickFilterButton(frame) end)
	view.refreshButton:SetScript("OnClick", function(frame) newReport:Refresh() end)
	


	for k, v in pairs(self) do
		newReport[k] = v
	end
	newReport:ToggleType()
	
	return newReport
end

function Report:InitEventHandlers()

end

function Report:ToggleType()
	if self.type == "category" then
		self.type = "character"
		self.model = CategoryModel
		self.model:ResetFilter()
		self.view.reportTitle:SetText(L["Category Summary"])
		self.view.headers[1]:SetText(L["Category"])
		self.view.headers[2]:SetText(L["Income"])
		self.view.headers[3]:SetText(L["Expense"])
		self.view.headers[4]:SetText(L["Net"])
	else
		self.type = "category"
		self.model = PlayerModel
		self.model:ResetFilter()
		self.view.reportTitle:SetText(L["Character Summary"])
		self.view.headers[1]:SetText(L["Character"])
		self.view.headers[2]:SetText(L["Income"])
		self.view.headers[3]:SetText(L["Expense"])
		self.view.headers[4]:SetText(L["Net"])
	end
end

function Report:Refresh()
	local view, model = self.view, self.model
	model:Refresh()
	local count = 1
	for i=1, model:GetSize() do
		if not view.rows[i] then
			view:CreateRow()
		end
		local name,income,expense,net = model:GetData(i)
		income,expense,net = FormatMoney(income), FormatMoney(expense), FormatMoney(net)
		view:SetText(i,name,income,expense,net)
		count = count + 1
	end
	
	if not view.rows[count] then
		view:CreateRow()
	end
	view.rows[count][1]:SetText(L["Total"])
	view.rows[count][2]:SetText(FormatMoney(model.data.total[1]))
	view.rows[count][3]:SetText(FormatMoney(model.data.total[2]))
	view.rows[count][4]:SetText(FormatMoney(model.data.total[3]))
	
	for i=count+1, view:GetRowCount() do
		view:SetText(i,"","","","")
	end
end

function Report:OnClickFilterButton(frame, button)
	if not frame.dropdown then
		frame.dropdown = CreateFrame("Frame", "rAccountantFilterMenu", nil, "UIDropDownMenuTemplate")
		UIDropDownMenu_Initialize(frame.dropdown, function(level) self:PopulateFilterMenu(level) end, "MENU")
		UIDropDownMenu_SetAnchor(0, 0, frame.dropdown, "TOPLEFT", frame, "BOTTOMLEFT")
	end
	ToggleDropDownMenu(1, nil, frame.dropdown)
end
function Report:OnClickReportHeader()
	self:ToggleType()
	self:Refresh()
end
function Report:PopulateFilterMenu(level)
	if level == 1 then
		for k,v in pairs(self.model.filters) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = L[k]
			info.keepShownOnClick = 1
			info.checked = not v
			info.func = self.OnCheckFilterOption
			info.arg1 = self
			info.arg2 = k
			UIDropDownMenu_AddButton(info)
		end
	end
end
function Report:OnCheckFilterOption(filter)
	self.model.filters[filter] = not self.model.filters[filter]
	self:Refresh()
end



--[[ External Access Module ]]--

Summary = DongleStub("Dongle-1.0"):New("rAccountant_Summary")

function Summary:Enable()
	local cmd = self:InitializeSlashCommand("rAccounantView Slash Command", "RACCOUNTANTVIEW", "account")
	cmd:RegisterSlashHandler("/account ui - Toggle the summary report", "ui", "ToggleUI")
end

function Summary:ToggleUI()
	if not self.view then
		self.view = Report:New()
		self.view:ToggleType()
	else
		if not self.view.view.frame:IsShown() then
			self.view.view.frame:Show()
		else
			self.view.view.frame:Hide()
		end
	end
end


