---level0

--crate a world
--local world = require("lib.core.ecsWorld")

-- create a physics world

local hc = require 'libs.ext.HC'

local res = require("src.levels.level0.res")
local bg = require("src.levels.level0.background")
local player = require("src.levels.level0.player.player")
local level = {}


function level:init()

  --load resources
  res:init()

  world = hc.new()
  camera = require("libs.core.camera")
  --initialise all the objects
  bg:init(res.backgroundImage)
  player:init(world,res.playerSpriteSheet)
  camera.target = player
  ground = world:rectangle(0, 800, 8000, 50)
  ground.type = "platform"

  platform = world:polygon(500,410, 640,550, 770,610, 840,530 )
  platform.type = "platform"

  --play the background music
end

function level:update(dt)

  --update all the objects
  bg:update(dt)
  player:update(dt)
  camera:update(dt)
end

function level:draw()


  -- draw all the objects
  bg:draw()

  camera:set()
  player:draw()
  love.graphics.setColor(1, .5, .25, 1)
  ground:draw("fill")
  platform:draw("fill")
  love.graphics.setColor(1, 1, 1, 1)
  camera:unset()

  --draw the background layer objects

  --draw the camera layer objects

  --draw the ui layer objects

end


return level
