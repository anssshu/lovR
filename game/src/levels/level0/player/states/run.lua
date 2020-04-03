local state = require("libs.core.state")

local module = function(player)
  local self = state("run")

  function self:on_enter(new_state,old_state)
    player.animation:play("run")
  end

  function self:on_exit(old_state,new_state)
  end

-----------state logic ------------------
  function self:state_logic(dt)
    if player.controls.left then
      player.vel.x = -400


    elseif player.controls.right then
      player.vel.x = 400

    end
  end
---------------transition logic ------------
  function self:transition_logic(dt)
    --run to idle
    if (player.controls.left or player.controls.right) == false then
      return player.statemachine.states.idle
    end
    --run to jump
    if player.controls.up then
      return player.statemachine.states.jump
    end
  end
  return self
end

return module
