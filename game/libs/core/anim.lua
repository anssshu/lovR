local anim8 = require 'libs.ext.anim8'


local animation ={}

function animation:init(filename,x,y,w,h)
  self.image = love.graphics.newImage("asset/myboy.png")
  self.w = w
  self.h = h
  self.g = anim8.newGrid(self.w, self.h, self.image:getWidth(), self.image:getHeight())
  self.face = "right"
  self.anim = {
    run =   {
              r = anim8.newAnimation(self.g('10-1',"5-1"), .015),
              l  = anim8.newAnimation(self.g('1-10',"1-5"), .015):flipH()
            },

    idle =  {
              r = anim8.newAnimation(self.g(9,4), 10),
              l = anim8.newAnimation(self.g(9,4), 10):flipH()
            },

    jump =  {
              r = anim8.newAnimation(self.g(1,1), 10),
              l = anim8.newAnimation(self.g(1,1), 10):flipH()
            }

      }
  self.currentAnim = "idle"
  self.x = x or 100
  self.y = y or 100
  self.sx = 1
  self.sy = 1
end

function animation:play(name)
      self.currentAnim = name
end


function animation:update(dt)
  if self.face == "right" then
    self.anim[self.currentAnim].r:update(dt)
  end
  if self.face == "left" then
    self.anim[self.currentAnim].l:update(dt)
  end
end

function animation:draw()

  if self.face == "left" then
    self.anim[self.currentAnim].l:draw(self.image, self.x-self.w/2, self.y-self.h/2,0,self.sx,self.sy)
  end

  if self.face == "right" then
    self.anim[self.currentAnim].r:draw(self.image, self.x-self.w/2, self.y-self.h/2,0,self.sx,self.sy)
  end

end

return animation
