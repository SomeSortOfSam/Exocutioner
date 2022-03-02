extends CharacterController

func _unhandled_input(event):
	var action = event.is_action("ui_down") or event.is_action("ui_up")
	action = action or event.is_action("ui_left") or event.is_action("ui_right")
	if action:
		var x = Input.get_axis("ui_left","ui_right")
		var y = Input.get_axis("ui_up","ui_down")
		var realitive_movement = Vector2(x,y)
		request_movement(realitive_movement)


func _on_Camera_rotation_requested(amount):
	rotate(transform.basis.y, amount)
