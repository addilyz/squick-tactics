
function love.load()
	 local function recursivelyDelete( item )
        if love.filesystem.getInfo( item , "directory" ) then
            for _, child in ipairs( love.filesystem.getDirectoryItems( item )) do
                recursivelyDelete( item .. '/' .. child )
                love.filesystem.remove( item .. '/' .. child )
            end
        elseif love.filesystem.getInfo( item ) then
            love.filesystem.remove( item )
        end
        love.filesystem.remove( item )
    end
    recursivelyDelete( 'recording' )
	cv = love.graphics.newCanvas(40,40)
	love.graphics.setCanvas(cv)
	love.graphics.rectangle("fill",0,0,40,40)
	love.graphics.setColor(1,.2,.2,1)
	love.graphics.rectangle("fill",20,0,20,20)
	love.graphics.setCanvas()
	love.graphics.setColor(1,1,1,1)
	rt = 0
	love.filesystem.createDirectory("recording")
end
local frame = 0
local dtc = 0
function love.update(dt)
	rt = rt + dt
    dtc = dtc + dt
    if dtc >= 1/30 then
    	frame = frame+1
    	local s = love.graphics.captureScreenshot(
    	"recording/"..string.format("%012d",frame) ..".png" )
	dtc = 0
    end
end

local nS = "example"
local nF = ".gif"
function recorder.compile(dest)os.execute( "ffmpeg -i " .. love.filesystem.getSaveDirectory() .. "/recording/%012d.png " .. name )
	if love.filesystem.exists(dest..nS..) then
		noTarget = true
		nI = 1
		while noTarget do
			if love.
		end
	end
	os.execute( "ffmpeg -i " .. love.filesystem.getSaveDirectory() .. "/recording/%012d.png " .. name )
end

function love.draw()
	love.graphics.draw(cv,60,60,rt,1,1,30,10)
end
