--handle collision for the player
local collisionHandler = require("libs.core.collisionHandler")

local module = function(player)
  local handler = collisionHandler()
-------------------------------------------------
  function handler:onCollisionEnter(o,v)

  end
------------------------------------------------
  function handler:onCollisionExit(o,v)

  end
-------------------------------------------------
  function handler:onCollisionStay(o,v)
    if o.type == "platform" and v.y <= 0 then
      --slide the velocity vector
      player.vel.x,player.vel.y = vec.slide(player.vel.x,player.vel.y,0,-1)
      self.collider:move(v.x,v.y)
    end
  end
------------------------------------------------
  return handler
end

return module
