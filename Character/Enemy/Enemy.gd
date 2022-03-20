extends CharacterController

var target : Spatial

func _process(_delta):
	if target:
		var position = target.to_global(target.translation)
		position = to_local(position)
		position = Vector2(position.x,position.z)
		var my_position = Vector2(translation.x,translation.z)
		request_movement(position - my_position)


func _on_Area_area_entered(area):
	target = area


func _on_Area_area_exited(area):
	if area == target:
		target = null


func _on_HitBox_area_entered(_area):
	queue_free()
