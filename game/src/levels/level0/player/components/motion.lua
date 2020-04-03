-- this code will work on every frame of the player
local module = function(player)
  local motion = {}

  function motion:init()
    --initialise player position and velocity
    player.x=0
    player.y=0
    player.vel = {x=0,y=0}
    player.g = 4000
    player.jumpSpeed = 2000
    player.walkSpeed = 700
  end

  function motion:update(dt)
    ----called on each state
    --update animation facing
    if player.controls.left then
      player.animation.face = "left"
    end
    if player.controls.right then
      player.animation.face = "right"
    end
    --update player velocity
    player.vel.y = player.vel.y + player.g*dt

    --move player collider
    player.collider:move(player.vel.x*dt,player.vel.y*dt)
    --update player position
    player.x,player.y = player.collider:center()
    --update animation position
    player.animation.x,player.animation.y = player.collider:center()
  end

  return motion
end

return module
