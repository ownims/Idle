local gamestate = require "gamestate"

function love.load()
	love.window.setMode(400, 300, {resizable=true, vsync=true})

    -- register the states with the gamestate library
    gamestate.register("menu", require "menu")
    gamestate.register("game", require "game")

    -- go to state menu
    gamestate.switch("menu")
end
