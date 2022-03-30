extends CharacterController

export var target_player_distance : float = 1

var target : Spatial

func _process(_delta):
	if target:
		var position = target.to_global(target.translation)
		position = to_local(position)
		if position.distance_squared_to(Vector3.ZERO) > pow(target_player_distance,2):
			request_movement(Vector2(position.x,position.z).normalized() * speed)


func _on_Area_area_entered(area):
	target = area

func _on_Area_area_exited(area):
	if area == target:
		target = null

func _on_HitBox_area_entered(_area):
	queue_free()
