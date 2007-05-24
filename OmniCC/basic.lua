--[[
	basic.lua
		A featureless version of OmniCC,

	To use it, change the file listings in OmniCC.toc to only the name of this file.
	You can also remove the saved variables line.
--]]

local ICON_SCALE = 37
local FONT_SIZE = 18
local TEXT_FONT = STANDARD_TEXT_FONT

local colors = {
	[86400] = { 0.4, 0.8, 1 }, -- Day.
	[3600] = { 0.7, 1, 0.4 },	-- Hour.
	[60] = { 1, 1, 0.4 }, -- Minute.
	[false] = { 1, 0.6, 0.4 }, -- Second.
}

local function GetFormattedTime(secs)

	if secs >= 86400 then

		return floor(secs / 86400 + 0.5), mod(secs, 86400), 86400

	elseif secs >= 3600 then

		return floor(secs / 3600 + 0.5), mod(secs, 3600), 3600

	elseif secs >= 60 then

		return floor(secs / 60 + 0.5), mod(secs, 60), 60

	end

	return floor(secs + 0.5), secs - floor(secs), false

end

local function Timer_OnUpdate(self, elapsed)
	if self.text:IsShown() then
		if self.nextUpdate <= 0 then
			local remain = self.duration - (GetTime() - self.start)
			if floor(remain + 0.5) > 0 then
				local time, toNextUpdate, toNextColor = GetFormattedTime(remain)
				if self.toNextColor == nil or (self.toNextColor and remain < self.toNextColor) then
					self.text:SetTextColor(unpack(colors[toNextColor]))
				end
				self.text:SetText(time)
				self.toNextUpdate = toNextUpdate
				self.toNextColor = toNextColor
			else
				self.text:Hide()
			end
		else
			self.nextUpdate = self.nextUpdate - elapsed
		end
	end
end

local function Timer_Create(self)
	local scale = min(self:GetParent():GetWidth() / ICON_SCALE, 1)

	local text
	if (FONT_SIZE * scale) > 8 then
		text = self:CreateFontString(nil, "OVERLAY")
		text:SetPoint("CENTER", self, "CENTER", 0, 1)
		text:SetFont(TEXT_FONT, FONT_SIZE * scale, "OUTLINE")
		text:SetTextColor(1, 0.9, 0)

		self.text = text
		self:SetScript("OnUpdate", Timer_OnUpdate)
	end
	return text
end

local function Timer_Start(self, start, duration)
	self.start = start
	self.duration = duration
	self.nextUpdate = 0

	local text = self.text or Timer_Create(self)
	if text then
		text:Show()
	end
end

hooksecurefunc("CooldownFrame_SetTimer", function(self, start, duration, enable)
	if start > 0 and duration > 3 and enable == 1 then
		Timer_Start(self, start, duration)
	else
		local text = self.text
		if text then
			text:Hide()
		end
	end
end)