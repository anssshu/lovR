--------------idle state--------------------------
local state = require("libs.core.state")

local module = function(player)

  local self = state("idle")
-----------------------------enter-----------------------------------
  function self:on_enter(new_state,old_state)
    player.animation:play("idle")
  end
------------------------------exit-----------------------------------
  function self:on_exit(old_state,new_state)
  end
------------------------------run-----------------------------------
  function self:state_logic(dt)
    player.vel.x = 0
  end
-----------------------------transition---------------------------------
  function self:transition_logic(dt)
    --idle to run
    if player.controls.left or player.controls.right then
      return player.statemachine.states.run
    end
    --idle to jump
    if player.vel.y == 0 and player.controls.up then
      return player.statemachine.states.jump
    end
  end
-----------------------------------------------------------------------------
  return self
end

return module
