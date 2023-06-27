extends KinematicBody2D

var directions = {
	"ui_up": Vector2.UP,
	"ui_down": Vector2.DOWN,
	"ui_left": Vector2.LEFT,
	"ui_right": Vector2.RIGHT,
}

onready var ray = $RayCast2D

func move(dir):
	var pos = directions[dir] * 64
	ray.cast_to = pos
	ray.force_raycast_update()
	if ray.is_colliding():
		return false
	else:
		self.position += pos
		return true
