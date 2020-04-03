local state = require("libs.core.state")

local module = function(player)
  local self = state("name")

  function self:on_enter(new_state,old_state)

  end

  function self:on_exit(old_state,new_state)
  end

  function self:state_logic(dt)
  end

  function self:transition_logic(dt)

  end
  return self
end

return module
