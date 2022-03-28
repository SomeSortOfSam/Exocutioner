extends Camera

export var speed := -PI/180 * .2

var active := true
 
signal rotation_requested(amount)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if event is InputEventMouseMotion and active:
		emit_signal("rotation_requested",event.relative.x * speed)
		rotate_x(event.relative.y * speed)
		rotation.x = clamp(rotation.x, -PI/2, PI/2)
	elif event.is_action_pressed("ui_cancel"):
		if Input.get_mouse_mode() != Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			active = false
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			active = true

