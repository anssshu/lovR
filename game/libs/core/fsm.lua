--code for finite state machne fsm
local module = function()
  local self = {
    states = {},
    state = {},
    previous_state = {},
  }
  --to be called in every_state

  -- add states to fsm
  function self:add_state(state)
    self.states[state.name] = state
  end
  -- change to a new_state
  function self:set_state(new_state)

    self.previous_state = self.state
    self.state = new_state

    if self.previous_state then
      self.state:on_exit(self.previous_state,new_state)
    end

    if new_state then
      self.state:on_enter(new_state,self.previous_state)
    end
  end

  -- update fsm at every frame
  function self:update(dt)
    
    if self.state then
      --update state logic
      self.state:state_logic(dt)
      --check for transition logic
      local next_state = self.state:transition_logic(dt)
      if next_state ~= nil then
        self:set_state(next_state)
      end
    end
  end

  -- if the state require to be drawn
  function self:draw()
    self.state:draw()
  end

  return self
end

return module
