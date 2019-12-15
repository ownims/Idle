local gamestate = require "gamestate"
local player = require "player"
local unit = require "unit"
local resource = require "resource"

local game = {}

local oldwidth = love.graphics.getWidth()
local oldheight = love.graphics.getHeight()

local width = love.graphics.getWidth()
local height = love.graphics.getHeight()
local MAXRESOURCE = 50

local resources = {}
local scale = 1
function game.load(player)

    if resources then
        for k,v in ipairs(resources) do
            resources[k].oldwidth = width
            resources[k].oldheight = height
            resources[k]:setScale()
        end
    end
    game.player = player or player.new()
    list = {'tree', 'rock'}
    --table.insert(list, 'tree')
    --table.insert(list, 'rock')

    --print(0)
    for i=1,MAXRESOURCE do
        res = resource.new(list[love.math.random(1,2)])
        table.insert(resources, res)
    end
end

function game.draw()
    --if #resources > 1 then
        for k,v in ipairs(resources) do
            resources[k]:draw()
        end
    --end
    game.player:draw()
    
    --fps
    love.graphics.setColor(1,0,0)
    love.graphics.printf(love.timer.getFPS(), 0, height-12, width, "right")
    love.graphics.setBackgroundColor(45/255,121/255,77/255)
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
    oldwidth = width
    oldheight = height

    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    if resources then
        for k,v in ipairs(resources) do
            resources[k]:setScale()
        end
    end
end

function game.keyreleased(key, scancode, isrepeat)
    
end

return game
