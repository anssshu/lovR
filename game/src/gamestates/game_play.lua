

local m = {}
-- load the level and create a wolrd
local world = require "src.levels.level0.level0"


function m:init()
  world:init()
end


function m:update(dt)
  world:update(dt)
end


function m:draw()
  world:draw()
end


return m
