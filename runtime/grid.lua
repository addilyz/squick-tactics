
local grid = {}
grid.assets = {}
grid.assets.tile = "assets/tile"
grid.assets.unpacked = {}
local gau = grid.assets.unpacked
gau.tile = {}
local fs = love.filesystem

local tileIndexRecurse = function(dir,table)
	local hnd = fs.getInfo(dir)
	for k,v in next,hnd do
		if v.type == "directory" then
			table[k] = {}
			tileIndexRecurse(dir .. "/" .. k,table[k])
		end
		if v.type == "file" then
			table[k] = lg.newImage(k)
		end
	end
end
function grid.start()
	codex.pages.getPage(2).grid = grid.draw
	local hnd = fs.getInfo(grid.assets.tile)
	for n=1, #hnd, 1 do
		if hnd[n].type == "directory" then
			gau.tile[k] = {}
			tileIndexRecurse(grid.assets.tile .. "/" .. k, gau.tile[k])
		end
		if hnd[n].type == "file" then
			table[k] = lg.newImage(k)
		end
	end
end
function grid.preload()
end
function grid.mousepressed(x,y,mb)
end
function grid.touchpressed(x,y)
end
function grid.mousereleased(x,y,mb)
end
function grid.touchreleased(x,y)
end
function grid.update(dt)
end
function grid.draw()
	for k,v in next,gau.tile do
		print(k)
	end
end
return grid