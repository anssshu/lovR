
--create the menu screen

local m = {}

--iniitialise the menu
function m:init()
end

--update the menu
function m:update(dt)

  ---transition logic for the menustaes
  if love.keyboard.isDown("p") then
    game.state = game.states.game_play
    game.state:init()
  end
end

--draw the menu screen
function m:draw()
  love.graphics.setBackgroundColor(1, 0, 1, 1)
end

return m
