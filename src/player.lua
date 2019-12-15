local unit = require "unit"
local player = {}

function player.new( )
    local o = {}
    o.units = {}
    -- callbacks
	o.draw = player.draw
    o.update = player.update
    o.spawn = player.spawn
    return o
end

function player:update( dt )
	if player.units then
		for k,v in ipairs(player.units) do
	    	player.units[k]:update(dt)
		end
	end
end
function player:draw( )
	if player.units then
		for k,v in ipairs(player.units) do
	    	player.units[k]:draw()
		end
	end
end
function player.spawn()
	--add unit
	if player.units then
	else
		player.units = {}
	end
	
	unt = unit.new ()
	table.insert(player.units, unt)
end

return player