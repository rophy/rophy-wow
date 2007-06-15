--[[ DongleStub ]]--

local major = "DongleStub"
local minor = tonumber(string.match("$Revision$", "(%d+)") or 1)

local g = getfenv(0)

if not g.DongleStub or g.DongleStub:IsNewerVersion(major, minor) then
	local lib = setmetatable({}, {
		__call = function(t,k) 
			if type(t.versions) == "table" and t.versions[k] then 
				return t.versions[k].instance
			else
				error("Cannot find a library with name '"..tostring(k).."'", 2)
			end
		end
	})

	function lib:IsNewerVersion(major, minor)
		local versionData = self.versions and self.versions[major]

		-- If DongleStub versions have differing major version names
		-- such as DongleStub-Beta0 and DongleStub-1.0-RC2 then a second
		-- instance will be loaded, with older logic.  This code attempts
		-- to compensate for that by matching the major version against
		-- "^DongleStub", and handling the version check correctly.

		if major:match("^DongleStub") then
			local oldmajor,oldminor = self:GetVersion()
			if self.versions and self.versions[oldmajor] then
				return minor > oldminor
			else
				return true
			end
		end

		if not versionData then return true end
		local oldmajor,oldminor = versionData.instance:GetVersion()
		return minor > oldminor
	end
	
	local function NilCopyTable(src, dest)
		for k,v in pairs(dest) do dest[k] = nil end
		for k,v in pairs(src) do dest[k] = v end
	end

	function lib:Register(newInstance, activate, deactivate)
		assert(type(newInstance.GetVersion) == "function",
			"Attempt to register a library with DongleStub that does not have a 'GetVersion' method.")

		local major,minor = newInstance:GetVersion()
		assert(type(major) == "string",
			"Attempt to register a library with DongleStub that does not have a proper major version.")
		assert(type(minor) == "number",
			"Attempt to register a library with DongleStub that does not have a proper minor version.")

		-- Generate a log of all library registrations
		if not self.log then self.log = {} end
		table.insert(self.log, string.format("Register: %s, %s", major, minor))

		if not self:IsNewerVersion(major, minor) then return false end
		if not self.versions then self.versions = {} end

		local versionData = self.versions[major]
		if not versionData then
			-- New major version
			versionData = {
				["instance"] = newInstance,
				["deactivate"] = deactivate,
			}
			
			self.versions[major] = versionData
			if type(activate) == "function" then
				table.insert(self.log, string.format("Activate: %s, %s", major, minor))
				activate(newInstance)
			end
			return newInstance
		end
		
		local oldDeactivate = versionData.deactivate
		local oldInstance = versionData.instance
		
		versionData.deactivate = deactivate
		
		local skipCopy
		if type(activate) == "function" then
			table.insert(self.log, string.format("Activate: %s, %s", major, minor))
			skipCopy = activate(newInstance, oldInstance)
		end

		-- Deactivate the old libary if necessary
		if type(oldDeactivate) == "function" then
			local major, minor = oldInstance:GetVersion()
			table.insert(self.log, string.format("Deactivate: %s, %s", major, minor))
			oldDeactivate(oldInstance, newInstance)
		end

		-- Re-use the old table, and discard the new one
		if not skipCopy then
			NilCopyTable(newInstance, oldInstance)
		end
		return oldInstance
	end

	function lib:GetVersion() return major,minor end

	local function Activate(new, old)
		-- This code ensures that we'll move the versions table even
		-- if the major version names are different, in the case of 
		-- DongleStub
		if not old then old = g.DongleStub end

		if old then
			new.versions = old.versions
			new.log = old.log
		end
		g.DongleStub = new
	end
	
	-- Actually trigger libary activation here
	local stub = g.DongleStub or lib
	lib = stub:Register(lib, Activate)
end



--[[ Tabulous ]]--

local vmajor = "Tabulous-0"
local vminor = 1

-- The library object.
local Tabulous = {}

-- A table storing all the inherit methods.
local TabulousObject = {}

-- List of methods to inherit.
local methods = {
	"GetFrame",
	"SetHeaderText",
	"GetHeaderText",
	"GetHeaderButton",
	"GetRowFrame",
	"FillRowData",
	"HideRow",
	"SetDataSize",
	"GetSlider",
	"GetDataSize",
	"SetValueChangeFunction",
	"GetColumnSize",
	"GetRowSize",
	"HideColumn",
	"ShowColumn",
	"IsColumnShown",
	"RefreshFrameWidth",
	"ReadjustFrames",
}  


--[[
	List of arguments:
		columns - number : size of columns.
]]
local defaultOptions = {
	["columns"] = 4,
	["rows"] = 20,
	['columnWidth'] = 60,
	['rowHeight'] = 20,
	['fontSize'] = 10,
	['justifyH'] = 'LEFT',
	['justifyV'] = 'CENTER',
	['headerFontObject'] = "GameFontNormal",
	['headerFontSize'] = 16,
}

function Tabulous:GetVersion() return vmajor, vminor end

function Tabulous:Create(...)
	local tabObj = {}
	
	-- Link non-exist items to default options.
	local opts = {}
	tabObj.opts = setmetatable(opts, {
		__index = function(t,k)
			return defaultOptions[k]
		end
	} )
	
	-- Fil the options.
	for i=1, select('#', ...), 2 do
		local opt = select(i, ...)
		local value = select(i+1, ...)
		opts[opt] = value
	end
	
	local hasHeader = true
	
	tabObj.headerButtons = {}
	
	-- Inherit the methods.
	for i, method in ipairs(methods) do
		tabObj[method] = TabulousObject[method]
	end
	
	-- Create the main display frame.
	local frame = CreateFrame("Frame")
	tabObj.frame = frame
	
	if opts.backdrop then
		frame:SetBackdrop(opts.backdrop)
	else
	end
	tabObj.inset = (opts.backdrop and opts.backdrop.insets) or { top=0,left=0,bottom=0,right=0 }
	
	if opts.backdropColorR then
		frame:SetBackdropColor(opts.backdropColorR, opts.backdropColorG, opts.backdropColorB)
	end
	
	local frameHeight = tabObj.inset.top + tabObj.inset.bottom + ( opts.rows + 1 ) * opts.rowHeight
	local frameWidth = tabObj.inset.left + tabObj.inset.right
	tabObj.rowFrames = {}
	tabObj.headerButtons = {}
	
	-- Create the header buttons.
	for i=1, opts.columns do
		local header = CreateFrame("Button", nil, frame)
		header:SetWidth(opts['columnWidth'..i] or opts.columnWidth)
		header:SetHeight(opts.rowHeight)
		if i == 1 then
			header:SetPoint("TOPLEFT", frame, "TOPLEFT", tabObj.inset.left, -tabObj.inset.top)
		else
			header:SetPoint("TOPLEFT", tabObj.headerButtons[i-1], "TOPRIGHT")
		end
		if opts.onClickHeader then
			header:SetScript("OnClick", opts.onClickHeader)
		end
		if opts.onEnterHeader then
			header:SetScript("OnEnter", opts.onEnterHeader)
		end
		if opts.onLeaveHeader then
			header:SetScript("OnLeave", opts.onLeaveHeader)
		end
		local fontString = header:CreateFontString(nil, "OVERLAY")
		if opts.headerFont then
			fontString:SetFont(opts.headerFont, opts.headerFontSize)
		else
			fontString:SetFontObject(opts.headerFontObject)
		end
		fontString:SetJustifyH(opts['justifyH'..i] or opts.justifyH)
		fontString:SetJustifyV(opts['justifyV'..i] or opts.justifyV)
		fontString:SetAllPoints(header)
		--header:SetFontString(fontString)
		if opts['header'..i..'text'] then
			fontString:SetText(opts['header'..i..'text'])
		end
		header.fontString = fontString

		tabObj.headerButtons[i] = header
		if opts.onInitHeader then
			opts.onInitHeader(i, header, fontString)
		end
	end
	
	-- Create the rows, each row is a button.
	for i=1, opts.rows do
		local rowFrame = CreateFrame("Button", nil, frame)
		rowFrame:EnableMouse(true)
		rowFrame.idx = i
		if i == 1 then
			if next(tabObj.headerButtons) then
				rowFrame:SetPoint("TOPLEFT", tabObj.headerButtons[1], "BOTTOMLEFT")
			else
				rowFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", tabObj.inset.left, -tabObj.inset.top)
			end
		else
			rowFrame:SetPoint("TOPLEFT", tabObj.rowFrames[i-1], "BOTTOMLEFT")
		end
		if opts.onClickRow then
			rowFrame:SetScript("OnClick",opts.onClickRow )
		end
		if opts.onEnterRow then
			rowFrame:SetScript("OnEnter",opts.onEnterRow )
		end
		if opts.onLeaveRow then
			rowFrame:SetScript("OnLeave",opts.onLeaveRow)
		end

		-- rowFrame:SetBackdrop(backdrop) -- For debugging only
		-- rowFrame:SetBackdropColor(0,1,1) -- For debugging only
		rowFrame.columnStrings = {}
		frameWidth = 0
		-- Create the fontStrings, each column is a fontString.
		for j=1, opts.columns do
			local fontString = rowFrame:CreateFontString(nil, "OVERLAY")
			fontString:SetFont(STANDARD_TEXT_FONT, opts.fontSize)
			local fontWidth = opts['columnWidth'..j] or opts.columnWidth
			fontString:SetWidth(fontWidth)
			fontString:SetJustifyH(opts['justifyH'..j] or opts.justifyH)
			fontString:SetJustifyV(opts['justifyV'..j] or opts.justifyV)
			frameWidth = frameWidth + fontWidth
			local fontHeight = opts.rowHeight
			fontString:SetHeight(fontHeight)
			if j == 1 then
				fontString:SetPoint("TOPLEFT", rowFrame, "TOPLEFT")
			else
				fontString:SetPoint("TOPLEFT", rowFrame.columnStrings[j-1], "TOPRIGHT")
			end
			rowFrame.columnStrings[j] = fontString
		end
		
		rowFrame:SetWidth(frameWidth)
		rowFrame:SetHeight(opts.rowHeight)
		tabObj.rowFrames[i] = rowFrame
		
		-- call back for more customization of the rowFrame.
		if opts.onInitRow then
			opts.onInitRow(i,rowFrame)
		end
	end
	local slider = opts.slider
	if not slider then
		slider = CreateFrame("Slider", nil, frame)
		slider:SetOrientation("VERTICAL")
		slider:SetWidth(8)
		slider:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -8, -3)
		slider:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -8, 3)
		slider:SetValue(1)
		slider:SetValueStep(1)
		slider:SetMinMaxValues(1,1)
		slider:SetThumbTexture("Interface\\Buttons\\UI-SliderBar-Button-Vertical")
		slider:SetBackdrop( {
			bgFile = "Interface\\Buttons\\UI-SliderBar-Background",
			edgeFile = "Interface\\Buttons\\UI-SliderBar-Border",
			tile = true,
			edgeSize = 8,
			tileSize = 8,
			insets = { left=3, right=3, top=3, bottom=3 }
		} )
	end
	
	if opts.valueChangeFunc then
		slider:SetScript("OnValueChanged", opts.valueChangeFunc)
	end
	tabObj.slider = slider
	
	frame:SetWidth(frameWidth + slider:GetWidth() + 20)
	frame:SetHeight(frameHeight)
	frame:Hide()
	
	if opts.onInitFrame then
		opts.onInitFrame(frame)
	end
	-- Return the initialized Tabulous object.
	return tabObj
end

--[[ Inherited Methods ]]--
function TabulousObject.GetFrame(self)
	return self.frame
end

function TabulousObject.SetHeaderText(self, column, text)
	self:GetHeaderButton(column).fontString:SetText(text)
end

function TabulousObject.GetHeaderText(self, column, text)
	self:GetHeaderButton(column).fontString:GetText(text)
end

function TabulousObject.GetHeaderButton(self, column)
	return self.headerButtons[column]
end

function TabulousObject.GetRowFrame(self, row)
	return self.rowFrames[row]
end

function TabulousObject.FillRowData(self, row, ...)
	-- currentRow is the row to add new data.
	if type(row) ~= 'number' or row > self.opts.rows then return end
	local rowFrame = self.rowFrames[row]
	if not rowFrame:IsShown() then
		rowFrame:Show()
	end
	for i = 1, self.opts.columns do
		local data = select(i, ...)
		if data == nil then
			data = ""
		end
		rowFrame.columnStrings[i]:SetText(tostring(data))
	end
end

function TabulousObject.HideRow(self, row)
	self.rowFrames[row]:Hide()
end

function TabulousObject.ReadjustFrames(self)
	local width = 0
	local point,relativeTo,relativePoint,xOffset,yOffset = "TOPLEFT",self.frame,"TOPLEFT",self.inset.left, -self.inset.top
	for i, header in ipairs(self.headerButtons) do
		if header:IsShown() then
			header:SetPoint(point, relativeTo, relativePoint, xOffset, yOffset)
			point,relativeTo,relativePoint,xOffset,yOffset = "TOPLEFT",header,"TOPRIGHT",0,0
			width = width + header:GetWidth()
		end
	end
	for i, rowFrame in ipairs(self.rowFrames) do
		point,relativeTo,relativePoint,xOffset,yOffset = "TOPLEFT",rowFrame,"TOPLEFT",0,0
		for j, fontString in ipairs(rowFrame.columnStrings) do
			if fontString:IsShown() then
				fontString:SetPoint(point, relativeTo, relativePoint, xOffset, yOffset)
				point,relativeTo,relativePoint,xOffset,yOffset = "TOPLEFT",fontString,"TOPRIGHT",0,0
			end
		end
		rowFrame:SetWidth(width)
	end
	width = width + self:GetSlider():GetWidth() + 20
	self.frame:SetWidth(width)
	return width
end

function TabulousObject.HideColumn(self, column)
	if self:IsColumnShown(column) then
		local header = self.headerButtons[column]
		header:Hide()
		for i, rowFrame in ipairs(self.rowFrames) do
			local fontString = rowFrame.columnStrings[column]
			fontString:Hide()
		end
		return self:ReadjustFrames()
	else
		return self.frame:GetWidth()
	end
end

function TabulousObject.ShowColumn(self, column)
	if not self:IsColumnShown(column) then
		local header = self.headerButtons[column]
		local opts = self.opts
		header:Show()
		for i, rowFrame in ipairs(self.rowFrames) do
			local fontString = rowFrame.columnStrings[column]
			fontString:Show()
		end
		return self:ReadjustFrames()
	else
		return self.frame:GetWidth()
	end
end

function TabulousObject.IsColumnShown(self, column)
	return self.headerButtons[column]:IsShown()
end

function TabulousObject.GetDataSize(self, dataSize)
	return self.dataSize
end

function TabulousObject.SetDataSize(self, dataSize)
	local size = dataSize - self.opts.rows
	if size < 0 then
		size = dataSize
		self:GetSlider():Hide()
	else
		self:GetSlider():SetMinMaxValues(1, size)
		self:GetSlider():Show()
	end
	self.dataSize = size
	
end

function TabulousObject.SetValueChangeFunction(self, handler)
	self:GetSlider():SetScript("OnValueChanged", function(this,index) handler(index) end )
end

function TabulousObject.GetSlider(self)
	return self.slider
end


local function Activate(self, old)

end

local function Deactivate(self, new)

end

 
 
 


Tabulous = DongleStub:Register(Tabulous, Activate, Deactivate)