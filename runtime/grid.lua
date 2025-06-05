
local grid = {}
local field = {}
field.__index = field
local grid.rot = 0
local grid.angle = 0
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
	return fieldObject
end

function field:prepRender()
	for y = 1, #self, 1 do
		for x = 1, #self[y], 1 do
			if self[y][x] == true then
				
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
