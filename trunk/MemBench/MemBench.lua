MemBench = {}

function MemBench:OnUpdate(diff)
	if not self.init then
		self.tick = 0
		self.memCurr = gcinfo()
		self.mem1 = self.memCurr
		self.mem2 = self.memCurr
		self.mem3 = self.memCurr
		self.mem4 = self.memCurr
		self.mem5 = self.memCurr
		self.mem6 = self.memCurr
		self.mem7 = self.memCurr
		self.mem8 = self.memCurr
		self.mem9 = self.memCurr
		self.mem10 = self.memCurr
		self.init = true
	else	
		self.tick = self.tick + diff
		if self.tick > 1 then
			self.tick = 0
			self.mem1, self.mem2, self.mem3, self.mem4, self.mem5, self.mem6, self.mem7, self.mem8, self.mem9, self.mem10 =
				self.memCurr, self.mem1, self.mem2, self.mem3, self.mem4, self.mem5, self.mem6, self.mem7, self.mem8, self.mem9
			self.memCurr = gcinfo()
			if self.mem1 > self.memCurr then
				self.mem1, self.mem2, self.mem3, self.mem4, self.mem5, self.mem6, self.mem7, self.mem8, self.mem9, self.mem10 =
					self.memCurr, self.memCurr, self.memCurr, self.memCurr, self.memCurr, self.memCurr, self.memCurr, self.memCurr, self.memCurr, self.memCurr
			end		
			MemBenchFrameText:SetText( string.format("%.3fM, %.1fK/s",self.memCurr/1024, (self.memCurr - self.mem10) / 10   ) );			
		end		
	end
end

