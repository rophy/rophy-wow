local AceOO = AceLibrary("AceOO-2.0")

CircularQueue = AceOO.Class()

function CircularQueue.prototype:init(size)
	CircularQueue.super.prototype.init(self)
	self.queue = {}
	if not size then
		size = 10
	end
	self.size = size + 1	-- with my implementation where will be one 'hole' in the queue, so add 1 to the size.
	self.front = 1
	self.rear = 1
end

function CircularQueue.prototype:GetMaxSize(size)
	return self.size
end

function CircularQueue.prototype:Next(index)
	index = index + 1
	if index > self.size then
		index = 1
	end
	return index
end

function CircularQueue.prototype:Prev(index)
	index = index - 1
	if index < 1 then
		index = self.size
	end
	return index
end

function CircularQueue.prototype:GetSize()
	local size = self.rear - self.front
	if size < 0 then size = self.rear + self.size - self.front end
	return size
	
end

-- Get i'th item without removing it from the queue.
function CircularQueue.prototype:Get(i)
	local index = self.front + i - 1
	if index > self.size then
		index = index - self.size
	end
	return self.queue[index]
end

function CircularQueue.prototype:Push(data)
	if self:Next(self.rear) == self.front then
		self.front = self:Next(self.front)
	end	
	self.queue[ self.rear ] = data
	self.rear = self:Next(self.rear)
end

function CircularQueue.prototype:Pop()
	if self.rear == self.front then
		return null
	else
		self.rear = self:Prev(self.rear)
		return self.queue[ self.rear ]
	end
end

function CircularQueue.prototype:Debug()
	print( "front: " .. self.front )
	print( "rear: " .. self.rear )
	print( "size: " .. self:Size() )
	print( "max: " .. self.size )
end

-- Generates a list which has index starts from 0.
function CircularQueue.prototype:ToList()
	local list = {}
	local size = self:GetSize()
	for i=1, size do
		table.insert(list, self:Get(i) )
	end
	return list
end
