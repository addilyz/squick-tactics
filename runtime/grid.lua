
local grid = {}
local field = {}
field.__index = field
local grid.rot = 0
local grid.angle = 0
local qv = {} -- quickVector
qv.arrays = {}
qv.targetArrayIndex = 0
qv.target = {}
local fx = love.graphics
local fs = love.filesystem
local lt = love.thread
fs.appendDirectory(true)
if type(fs.getInfo("/project/grid/global")) == "table" then grid.settings = fs.load("project/grid/global")() end
local threads = {}

function grid.load(loc,canvas) -- canvas completely optional. surely if you want it you'll know. easy access.
	loc = "grid/maps/" .. loc
	local fieldObject = setmetatable(fs.load(loc)(),field)
	if fieldObject.settings == nil then fieldObject.settings = grid.settings end
	if type(canvas) ~= "nil" then
		fieldObject.hasTexture = true
		fieldObject.texture = canvas
	else
		fieldObject.hasTexture = false
	end
	if fieldObject.hasSheet then slides end
	return fieldObject
end

function qv.newArray(overwrite)
	local overwrite = overwrite or false
	if overwrite then
		qv.arrays[qv.targetArrayIndex] = {}
		return qv.targetArrayIndex
	else
		qv.arrays[#qv.arrays+1] = {}
		return qv.arrays[#qv.arrays]
	end
end

function qv.setArray(index)
	qv.targetArrayIndex = index
	qv.target = qv.arrays[qv.targetArrayIndex]
end

function qv.getVect(x,y) -- TOOL ORIENTED FUNCTION
	for n = 1, #qv.target, 1 do
		if qv.target[n][1] == x and qv.target[n][2] == y then
			return n
		end
	end
	qv.target[#qv.target+1] = {x,y}
end

function qv.buildPoly(arrayIndices,sourceOverride,overrideTarget)
	local sourceOverride = sourceOverride or false
	local target = {}
	if sourceOverride then
		target = overrideTarget
	else
		target = qv.target
	end
	local t = {}
	local l = 0
	for n = 1, #arrayIndices, 1 do
		t[l+1] = qv.target[arrayIndices[n][1]]
		t[l+2] = qv.target[arrayIndices[n][2]]
		l = l + 2
	end
	return t
end

function field:mkPoly() -- TOOL ORIENTED FUNCTION
	self.arrayIndex = qv.newArray()
	qv.setArray(self.arrayIndex)
	local tile = {}
	local tw = self.settings.tileWidth
	local tl = self.settings.tileLength
	for x = 1, self.mathyGrid, 1 do
		for y = 1, self.mathyGrid[x] do
			if self.mathyGrid[x][y] then
				
			end
		end
	end
end

function field:polygonPrep()
	for y = 1, #self, 1 do
		for x = 1, #self[y], 1 do
			if self[y][x] == true then
				
				self.poly[]
			end
		end
	end
end

function field:update(dt)
	
end

function field:preRenderAdjust(yaw,pitch)
	
end

function field:draw()
	for n = 1, #self.poly, 1 do
		fx.polygon("line",self.poly[n])
	end
end
