local sprite = {}

function sprite:init()
  self.image = love.graphics.newImage("")
  self.q = love.graphics.newQuad(900, 0,100, 160,self.image:getDimensions())
  self.x=0.0
  self.y=0.0
  self.rot = 0.0
  self.scale = 1.0
  self.sx=1--sacle x
  self.sy=1--scale y
  self.ax=0.5--x anchor
  self.ay=0.5--y anchor
end

function sprite:update(dt)

end

function sprite:draw()
  love.graphics.draw(self.image,self.q,self.x,self.y,math.rad(self.rot),self.sx*self.scale,self.sy*self.scale,self.ax*100,self.ay*160)
end

return sprite
