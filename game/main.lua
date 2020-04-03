
--load the game
local game = require "game"

--make the game global
_G.game = game

--load the love game
function love.load()
  game:init()
end


-- update the game
function love.update(dt)
  game:update(dt)
end

-- draw the game
function love.draw()
  game:draw()
end
