
--list of all the resources used in level 0
res = {}

function res:init()
  self.backgroundImage = love.graphics.newImage("asset/mountain.png")
  self.playerSpriteSheet = love.graphics.newImage("asset/myboy.png")
end

return res
