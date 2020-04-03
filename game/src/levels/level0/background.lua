local m ={}
function m:init(image)
  self.image = image
end

function m:update()

end

function m:draw()
  love.graphics.draw(self.image, 0, 0, 0,.8,.8)
end

return m
