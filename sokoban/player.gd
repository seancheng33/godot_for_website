extends KinematicBody2D

var directions = {
	"ui_up": Vector2.UP,
	"ui_down": Vector2.DOWN,
	"ui_left": Vector2.LEFT,
	"ui_right": Vector2.RIGHT,
}

onready var ray = $RayCast2D

func _ready():
	$AnimationPlayer.play("ui_down")

func _input(event):
	for dir in directions:
		if event.is_action_pressed(dir):
			move(dir)
	
func move(dir):
	$AnimationPlayer.play(dir)
	var pos = directions[dir] * 64
	ray.cast_to = pos
	ray.force_raycast_update()
	if ray.is_colliding():
		var collider = ray.get_collider()
		if collider.is_in_group("box"):
			if collider.move(dir) :
				self.position += pos
	else:
		self.position += pos
