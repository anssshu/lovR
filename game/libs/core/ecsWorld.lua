
local ecs = require("lib.ext.tiny")

--create a loading system

local initSystem = ecs.processingSystem({initSystem=""})
initSystem.filter = ecs.requireAll("init")
function initSystem:process(e,dt)
  e:init()
end


--create an update system
local updateSystem = ecs.processingSystem({updateSystem=""})
updateSystem.filter = ecs.requireAll("update")
--create a functon for the updateSystem
function updateSystem:process(e,dt)
  e:update(dt)
end



--create a drawing systems
local drawingSystem = ecs.processingSystem({drawingSystem=""})
drawingSystem.filter = ecs.requireAll("draw")
function drawingSystem:process(e,dt)
  e:draw()
end



--------------------------------------------------------
--create a world
local world = ecs.world(initSystem,updateSystem,drawingSystem)

--initialise the world
function world:_init()
  --initialise the world
  self:update(dt,ecs.requireAll("initSystem"))
end

--update the world
function world:_update(dt)
  self:update(dt,ecs.requireAll("updateSystem"))
end

--draw the world
function world:_draw()
  self:update(dt,ecs.requireAll("drawingSystem"))
end
--------------------------------------------------------------

return world
