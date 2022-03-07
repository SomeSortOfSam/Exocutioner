extends CharacterController

func _physics_process(delta):
	var x = Input.get_axis("ui_left","ui_right")
	var y = Input.get_axis("ui_up","ui_down")
	var realitive_movement = Vector2(x,y)
	request_movement(realitive_movement)
	


func _on_Camera_rotation_requested(amount):
	rotate(transform.basis.y, amount)
