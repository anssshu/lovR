--
--create a state object
local state = function(state_name)
  local self = {}
  self.name = state_name

  function self:on_enter(new_state,old_state)
  end

  function self:on_exit(old_state,new_state)
  end

  function self:state_logic(dt)
  end

  function self:transition_logic(dt)

  end

  function self:draw()
  end

  return self
end

return state
