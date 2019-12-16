local gamestate = require "gamestate"
local player = require "player"
local unit = require "unit"
local resource = require "resource"

local game = {}

local oldwidth = love.graphics.getWidth()
local oldheight = love.graphics.getHeight()

local width = love.graphics.getWidth()
local height = love.graphics.getHeight()
local MAXRESOURCE = 10

local resources = {}
local scale = 1

local grid = {}
local tile
local tilesize = 16
local scale = height/300
local map
local ratio = width/height

function game.load(player)
    resources = {}
    game.player = player or player.new()
    list = {'tree', 'rock'}

    for i=1,MAXRESOURCE do
        res = resource.new(list[love.math.random(1,2)])
        res:setScale()
        table.insert(resources, res)
    end
    tile = createTile()
    map = createMap()
end

function game.draw()
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()

   draw_map()
   --love.graphics.draw(tile, 10,10)
    
    for k,v in ipairs(resources) do
        resources[k]:draw()
    end
    game.player:draw()
    
    --fps
    love.graphics.setColor(1,0,0)
    love.graphics.printf(love.timer.getFPS(), 0, height-12, width, "right")
end

function draw_map()

    width = love.graphics.getWidth()
    height = love.graphics.getHeight()

    ratio = width/height

    love.graphics.setColor(1,1,1)
    love.graphics.draw( map, 0, 0, 0, scale,scale)
end

function createMap()
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()

    ratio = width/height
    canvas = love.graphics.newCanvas(400,300)
    love.graphics.setCanvas(canvas)
    love.graphics.setColor(1,1,1)
    ww = 400 / tilesize
    hh = 300 / tilesize
    for x = 0, ww do
        for y = 0, hh do
            love.graphics.draw(tile, x * tilesize, y * tilesize)
        end
    end
    love.graphics.setCanvas()
    data = canvas:newImageData()
   return love.graphics.newImage(data)
end

function createTile()
    canvas = love.graphics.newCanvas(16,16)
    love.graphics.setCanvas(canvas)
    love.graphics.setColor(1,1,1)
    for x = 0, 16 do
        for y = 0, 16 do         
            r = 45/255
            g = love.math.random(84,121)/255
            b = love.math.random(65,77)/255
            love.graphics.setColor( r, g, b)
            love.graphics.rectangle( 'fill', x , y, 1, 1)
        end
    end
    love.graphics.setCanvas()
    data = canvas:newImageData()
    return love.graphics.newImage(data)
end

function game.update(dt)
    game.player:update(dt)
end

function game.keypressed(key, scancode, isrepeat)
    if key == "escape" then
        gamestate.switch("menu", game.player)
    elseif key == "q" then
        game.player:spawn()
    end
end

function game.resize(w, h)
    width = w
    height = h
    scale = height/300
    if resources then
        for k,v in ipairs(resources) do
            resources[k]:setScale()
        end
    end
end

function game.keyreleased(key, scancode, isrepeat)
    
end

return game
