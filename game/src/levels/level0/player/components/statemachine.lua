local fsm = require("libs.core.fsm")

local idle = require("src.levels.level0.player.states.idle")
local run = require("src.levels.level0.player.states.run")
local jump = require("src.levels.level0.player.states.jump")

local module = function(player)
  local machine = fsm()
  function machine:init()
    self:add_state(idle(player))
    self:add_state(run(player))
    self:add_state(jump(player))

    self:set_state(idle(player))
  end

  return machine
end
return module
