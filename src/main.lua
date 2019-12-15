local gamestate = require "gamestate"

function love.load()
	love.window.setMode(400, 300, {resizable=true, vsync=true})

    -- register the states with the gamestate library
    gamestate.register("menu", require "menu")
    gamestate.register("game", require "game")

    -- go to state menu
    gamestate.switch("menu")
end
function love.resize(w, h)
	print(("Window resized to width: %d and height: %d."):format(w, h))
    print("resize")
    
    for k,v in ipairs(resources) do
        resources[k]:setScale()
    end
end