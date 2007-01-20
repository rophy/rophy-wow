scmTimestamps = {}

function scmTimestamps:Enable()

	local frame
	
	local scmAddMessage = function(frame, text, r, g, b, id)
		self:AddMessage(frame, text, r, g, b, id)
	end
	
	-- On first enble, save the reference to the original functions.
	if not self.hooks then
		self.hooks = {}
		for i = 1, 7 do
			frame = _G["ChatFrame"..i]
			self.hooks[frame] = frame.AddMessage
		end
	end

	-- Now hook the functions.	
	for i = 1, 7 do
			frame = _G["ChatFrame"..i]
			frame.AddMessage = scmAddMessage
	end
end

function scmTimestamps:Disable()
	for i = 1, 7 do
		local frame = _G["ChatFrame" .. i]
		frame.AddMessage = self.hooks[frame]
	end
end

function scmTimestamps:AddMessage(frame, text, r, g, b, id)
	if text then
		text = string.format("|cff777777(%s)|r %s", date("%X"), text)
	end
	self.hooks[frame](frame, text, r, g, b, id)
end

scmTimestamps:Enable()
