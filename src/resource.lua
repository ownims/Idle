local resource = {}

local width = love.graphics.getWidth()
local height = love.graphics.getHeight()

function resource.new(type)
	local o = {}
	o.scale = 1
	o.oldwidth = width
	o.oldheight = height
	o.type = type
	o.name = type
	o.w = 16*o.scale
	o.h = 16*o.scale
	o.x = love.math.random(o.w,width-o.w)
	o.y = love.math.random(o.h,height-o.h)

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

function  resource.resize(w,h )
	
end
function resource:setScale()
	self.oldwidth = width
	self.oldheight = height
	
	width = love.graphics.getWidth()
	height = love.graphics.getHeight()
	self.scale = height/300
	self:recalculate(self.scale)
end
function resource:recalculate(scale)
	self.scale = scale
	--if o.type == 'tree' then
	self.color_trunk = {0.68,0.36,0.17}
	self.trunk = {
			{6*self.scale, 15*self.scale, 0, 0, 1,1,1, 1.0},
			{10*self.scale, 15*self.scale, 0, 0, 1,1,1, 1.0},
			{10*self.scale, 11*self.scale, 0, 0, 1,1,1, 1.0},
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
	--elseif self.type == 'rock' then
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
	--end

	width = love.graphics.getWidth()
	height = love.graphics.getHeight()
	self.w = 16*self.scale
	self.h = 16*self.scale
	self.x = (self.x / self.oldwidth) * width
	self.y = (self.y / self.oldheight) * height
	print(0)
end
return resource