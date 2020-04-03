

local game = {} --update and draw is inside it


-- game resolution
game.settings ={
	--my current desktop has a resolution of 1920/1080:16/9
	x_res  =  1440,
	y_res  =   900,
}

local W  =  love.graphics.getWidth()
local H = love.graphics.getHeight()

game.sx= W/game.settings.x_res
game.sy = H/game.settings.y_res
--local x,y = love.window.getDesktopDimensions()
--print(W,H,x,y)


--load all the gamestates
local menu = require("src.gamestates.menu")
local game_play = require("src.gamestates.game_play")
local gameover = require("src.gamestates.gameover")

-- add all the game states to the game
game.name = "my_game"
game.states = {menu=menu,game_play=game_play,gameover=gameover}


--set the current state of the game
game.state = menu


---- run the game

function game:init()
	--initialise all the game states
  for i,state in pairs(self.states) do
    state:init()
  end
end

function game:update(dt)
  self.state:update(dt)
end

function game:draw()
  ---draw as per resolution
	love.graphics.push()
	love.graphics.scale(self.sx,self.sy)

  self.state:draw()

  love.graphics.pop()
end





return game
