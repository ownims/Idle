local resource = {}

local width = love.graphics.getWidth()
local height = love.graphics.getHeight()

function resource.new(type)
	local o = {}
	o.scale = 1
	o.min_w = 400
	o.min_h = 300
	o.type = type
	o.name = type
	o.start_w = 16
	o.start_h = 16
	o.start_x = love.math.random(o.start_w, o.min_w - o.start_w)
	o.start_y = love.math.random(o.start_h, o.min_h - o.start_h)
	o.w = o.start_w*o.scale
	o.h = o.start_h*o.scale
	o.x = o.start_x*o.scale
	o.y = o.start_y*o.scale

	o.draw = resource.draw
    o.update = resource.update
    o.setScale = resource.setScale
    o.resize = resource.resize
    o.recalculate = resource.recalculate
	o:recalculate(o.scale)
	
    -- callbacks
    return o
end

function resource:update(dt)
	
end

function resource:draw()
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

function resource.resize(w,h)
	self:setScale()
end

function resource:setScale()
	--self.oldwidth = width
	--self.oldheight = height
	
	width = love.graphics.getWidth()
	height = love.graphics.getHeight()
	self.scale = height/300
	self:recalculate(self.scale)
end

function resource:recalculate(scale)
	self.scale = scale
	if self.type == 'tree' then
		self.color_trunk = {0.68,0.36,0.17}
		self.trunk = {
				{6*self.scale, 15*self.scale, 0, 0, 1,1,1, 1.0},
				{9*self.scale, 15*self.scale, 0, 0, 1,1,1, 1.0},
				{9*self.scale, 11*self.scale, 0, 0, 1,1,1, 1.0},
				{6*self.scale, 11*self.scale, 0, 0, 1,1,1, 1.0},
			}
		self.mesh_trunk = love.graphics.newMesh(self.trunk, "fan", "static")
		self.color_leaf = {0,0.21,0.18}
		self.leaf = {
				{3*self.scale, 11*self.scale, 0, 0, 1,1,1, 1.0},
				{12*self.scale, 11*self.scale, 0, 0, 1,1,1, 1.0},
				{8*self.scale, 0*self.scale, 0, 0, 1,1,1, 1.0},
				{7*self.scale, 0*self.scale, 0, 0, 1,1,1, 1.0},
			}
		self.mesh_leaf = love.graphics.newMesh(self.leaf, "fan", "static")
	elseif self.type == 'rock' then
		self.color_rock = {0.38,0.38,0.38}
		self.rock = {
				{3*self.scale, 14*self.scale, 0, 0, 1,1,1, 1.0},
				{11*self.scale, 14*self.scale, 0, 0, 1,1,1, 1.0},
				{14*self.scale, 11*self.scale, 0, 0, 1,1,1, 1.0},
				{14*self.scale, 10*self.scale, 0, 0, 1,1,1, 1.0},
				{10*self.scale, 3*self.scale, 0, 0, 1,1,1, 1.0},
				{6*self.scale, 3*self.scale, 0, 0, 1,1,1, 1.0},
				{1*self.scale, 8*self.scale, 0, 0, 1,1,1, 1.0},
				{1*self.scale, 12*self.scale, 0, 0, 1,1,1, 1.0},
			}
		self.mesh_rock = love.graphics.newMesh(self.rock, "fan", "static")
	end

	self.w = self.start_w * self.scale
	self.h = self.start_h * self.scale
	self.x = self.start_x * self.scale
	self.y = self.start_y * self.scale
end

return resource