
local module = function()
  local m = {}
  function m:init(world,collider)
    self.world = world
    self.collider = collider
  end

  function m:update(dt)
    self:handleCollision()
  end
  function m:handleCollision()

          local col = self.world:collisions(self.collider)
          --print(self.name)
          local last_other ={}--last collidind shape
          local v = {} -- last separating vector
          for other,vector in pairs(col) do
                  last_other = other
                  v = vector
          end
          if (next(col)==nil) then ----if there is no collision
              if self.iscolliding == true then --if object was previously colliding
                  --print("col exit")
                  self:onCollisionExit(last_other,v)
              end
              self.iscolliding = false
              --print("no col")
          else ----if there is collision
              if self.iscolliding == false then --if object was previously not colliding
                  --print("col enter")

                  self:onCollisionEnter(last_other,v)

              end
              self.iscolliding = true
              --print("col stay")

              self:onCollisionStay(last_other,v)

          end


      end


  function m:onCollisionEnter(o,v)

  end

  function m:onCollisionExit(o,v)

  end

  function m:onCollisionStay(o,v)
      --print("col stay")
  end


  m:init()
  return m
end
return module
