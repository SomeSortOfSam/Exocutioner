extends CharacterController

onready var gun : Gun = $MagmaMagnum
onready var shoot_timer = $ShootTimer
onready var animator : AnimatedSprite3D = $Sprite3D

export var target_player_distance : float = 1

var target : Spatial

func _process(_delta):
	if target and animator.animation != 'Dead':
		var position = target.to_global(target.translation)
		look_at(position,transform.basis.y)
		position = to_local(position)
		if position.distance_squared_to(Vector3.ZERO) > pow(target_player_distance,2):
			if animator.animation == 'Stand':
				animator.animation = 'Run'
			request_movement(Vector2(position.x,position.z).normalized() * speed)
		elif shoot_timer.time_left == 0:
			shoot_timer.start()


func _on_Area_area_entered(area):
	target = area

func _on_Area_area_exited(area):
	if area == target:
		target = null

func _on_HitBox_area_entered(_area):
	animator.play('Dead')

func _on_ShootTimer_timeout():
	gun._shoot()
	animator.play('Shoot')

func _on_Sprite3D_animation_finished():
	if animator.animation == 'Dead':
		queue_free()
	animator.play('Stand')
