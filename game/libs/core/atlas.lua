

local atlas = {}

function atlas:init(image,q)
    self.image = image
    self.q = q
    self.quad = love.graphics.newQuad( self.q.x, self.q.y, self.q.width, self.q.height, self.image:getDimensions() )
    self.x=0.0
    self.y=0.0
    self.rot = 0.0
    self.scale = 1.0
    self.sx=1--sacle x
    self.sy=1--scale y
    self.ax=0.5--x anchor
    self.ay=0.5--y anchor

end
function atlas:update(dt)

end

function self:draw()
        --love.graphics.draw(self.image,self.quad,0,0)
  love.graphics.draw(self.image,self.quad,self.x,self.y,self.rot,self.sx*self.scale,self.sy*self.scale,self.ax*self.q.width,self.ay*self.q.height)

end




return atlas
