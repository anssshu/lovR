vec = require("libs.ext.HC.vector-light")

-- load all the player components
local controls = require("src.levels.level0.player.components.controls")
local animation = require("src.levels.level0.player.components.animation")

local statemachine = require("src.levels.level0.player.components.statemachine")
local collisionHandler = require("src.levels.level0.player.components.collisionHandler")
local motion = require("src.levels.level0.player.components.motion")



local player = {}


function player:init(world,image)
  --initialise all the components
  self.controls = controls
  self.controls:init()

  self.animation = animation
  self.animation:init(image)

  self.motion = motion(self)
  self.motion:init()

  self.collider = world:rectangle(0,200,100,160)

  self.collisionHandler = collisionHandler(self)
  self.collisionHandler:init(world,self.collider)

  self.statemachine = statemachine(self)
  self.statemachine:init()
end

function player:update(dt)
  --update all the player components
  self.controls:update(dt)
  self.animation:update(dt)
  self.collisionHandler:update(dt)
  self.statemachine:update(dt)
  self.motion:update(dt)

end

function player:draw()
  --draw the drawable componnets
  self.animation:draw()
  self.collider:draw()
end

return player
