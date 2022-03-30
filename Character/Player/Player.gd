extends CharacterController

onready var camera = $Camera

var prev_rot : Vector3

func _process(_delta):
	if prev_rot.distance_squared_to(transform.basis.y) >= .001*.001:
		var angle = prev_rot.signed_angle_to(transform.basis.y, -transform.basis.x)
		camera.rotate_x(angle)
		camera.rotation.x = clamp(camera.rotation.x,-PI/2,PI/2)
	prev_rot = transform.basis.y

func _physics_process(_delta):
	var x = Input.get_axis("ui_left","ui_right")
	var y = Input.get_axis("ui_up","ui_down")
	var realitive_movement = Vector2(x,y)
	request_movement(realitive_movement)

func _on_Camera_rotation_requested(amount):
	rotate(transform.basis.y, amount)
