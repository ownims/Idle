local unit = {}

function unit.new( )
	wid = love.graphics.getWidth()
	hei = love.graphics.getHeight()
	local o = {}
	o.color = {253/255,161/255,129/255}
	o.body = {
		{6, 15, 0, 0, 1,1,1, 1.0},
		{10, 15, 0, 0, 1,1,1, 1.0},
		{10, 11, 0, 0, 1,1,1, 1.0},
		{6, 11, 0, 0, 1,1,1, 1.0},
	}
	o.mesh_body = love.graphics.newMesh(o.body, "fan", "static")

	o.name = "unidade" ..  love.math.random(1,5)


	o.w = 16
	o.h = 16


	o.x = love.math.random(o.w,wid-o.w)
	o.y = love.math.random(o.h,hei-o.h)
    -- callbacks
	o.draw = unit.draw
    o.update = unit.update
    return o

end

function unit:update( dt )
	
end

function unit:draw()
	love.graphics.setColor(self.color)
    love.graphics.draw(self.mesh_body, self.x , self.y, 0)
end

return unit