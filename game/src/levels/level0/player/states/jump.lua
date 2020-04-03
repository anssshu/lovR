local state = require("libs.core.state")

local module = function(player)
  local self = state("jump")

  function self:on_enter(new_state,old_state)
    player.animation:play("jump")
  end

  function self:on_exit(old_state,new_state)
  end

  function self:state_logic(dt)
    if player.controls.up and player.vel.y == 0 then
      player.vel.y = -player.jumpSpeed
    end
    if player.controls.left then
      player.vel.x = -player.walkSpeed
    end
    if player.controls.right then
      player.vel.x = player.walkSpeed
    end
  end

  function self:transition_logic(dt)
    --jump to idle
    if player.vel.y == 0 and not(player.controls.left or player.controls.right) then
      return player.statemachine.states.idle
    end
    -- jump to run
    if player.vel.y == 0 and (player.controls.left or player.controls.right) then
      return player.statemachine.states.run
    end

  end
  return self
end

return module
