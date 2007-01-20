scmScroll = {}

function scmScroll:Enable()
	for i = 1, 7 do
		local cf = _G["ChatFrame"..i]
		cf:SetScript("OnMouseWheel", function() self:Scroll() end)
		cf:EnableMouseWheel(true)
	end
end

function scmScroll:Disable(msg)
	for i = 1, 7 do
		local cf = _G["ChatFrame"..i]
		cf:SetScript("OnMouseWheel", nil)
		cf:EnableMouseWheel(false)
	end
end

function scmScroll:Scroll()
	if arg1 > 0 then
		if IsShiftKeyDown() then
			this:ScrollToTop()
		elseif IsControlKeyDown() then
			this:PageUp()
		else
			this:ScrollUp()
		end
	elseif arg1 < 0 then
		if IsShiftKeyDown() then
			this:ScrollToBottom()
		elseif IsControlKeyDown() then
			this:PageDown()
		else
			this:ScrollDown()
		end
	end
end

scmScroll:Enable()

