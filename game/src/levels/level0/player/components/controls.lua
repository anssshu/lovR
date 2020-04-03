
---player controls

local controls = {}

function controls:init()
  self.left  = false
  self.right = false
  self.up    = false
  self.down  = false
  self.attack = false
end

function controls:update(dt)
  self.left  =  love.keyboard.isDown("a") or love.keyboard.isDown("left")
  self.right =  love.keyboard.isDown("d") or love.keyboard.isDown("right")
  self.up    =  love.keyboard.isDown("w") or love.keyboard.isDown("up")
  self.down  =  love.keyboard.isDown("s") or love.keyboard.isDown("down")
  self.attack = love.keyboard.isDown("space")
end

return controls
