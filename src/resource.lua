local resource = {}


function resource.new(type)
	wid = love.graphics.getWidth()
	hei = love.graphics.getHeight()

	local o = {}

	o.type = type
	o.name = type
	--if o.type == 'tree' then
	o.color_trunk = {0.68,0.36,0.17}
	o.trunk = {
			{6, 15, 0, 0, 1,1,1, 1.0},
			{10, 15, 0, 0, 1,1,1, 1.0},
			{10, 11, 0, 0, 1,1,1, 1.0},
			{6, 11, 0, 0, 1,1,1, 1.0},
		}
	o.mesh_trunk = love.graphics.newMesh(o.trunk, "fan", "static")
	o.color_leaf = {0,0.21,0.18}
	o.leaf = {
			{3, 11, 0, 0, 1,1,1, 1.0},
			{12, 11, 0, 0, 1,1,1, 1.0},
			{8, 0, 0, 0, 1,1,1, 1.0},
			{7, 0, 0, 0, 1,1,1, 1.0},
		}
	o.mesh_leaf = love.graphics.newMesh(o.leaf, "fan", "static")
	--elseif o.type == 'rock' then
	o.color_rock = {0.38,0.38,0.38}
	o.rock = {
			{3, 14, 0, 0, 1,1,1, 1.0},
			{11, 14, 0, 0, 1,1,1, 1.0},
			{14, 11, 0, 0, 1,1,1, 1.0},
			{14, 10, 0, 0, 1,1,1, 1.0},
			{10, 3, 0, 0, 1,1,1, 1.0},
			{6, 3, 0, 0, 1,1,1, 1.0},
			{1, 8, 0, 0, 1,1,1, 1.0},
			{1, 12, 0, 0, 1,1,1, 1.0},
		}
	o.mesh_rock = love.graphics.newMesh(o.rock, "fan", "static")
	--end
	o.w = 16
	o.h = 16
	o.x = love.math.random(o.w,wid-o.w)
	o.y = love.math.random(o.h,hei-o.h)

    -- callbacks
	o.draw = resource.draw
    o.update = resource.update
    return o
end

function resource:update(dt)
	
end

function resource:draw()
	print("esttow")
	if self.type == "tree" then
		love.graphics.setColor(self.color_trunk)
	    love.graphics.draw(self.mesh_trunk, self.x , self.y, 0)
		love.graphics.setColor(self.color_leaf)
	    love.graphics.draw(self.mesh_leaf, self.x , self.y, 0)
	elseif self.type == "rock" then
		love.graphics.setColor(self.color_rock)
	    love.graphics.draw(self.mesh_rock, self.x , self.y, 0)
	end
end
return resource