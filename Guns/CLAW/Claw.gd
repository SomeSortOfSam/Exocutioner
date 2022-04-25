extends Gun

onready var ray : RayCast = $RayCast

func _shoot():
	if ray.is_colliding() and not sprite.animation == 'Grab':
		emit_signal("recoil",Vector2(0,-30))
		sprite.play('Grab')
		sounds.play()
		var hit : Node = ray.get_collider().get_parent()
		if hit.has_method("_on_HitBox_area_entered"):
			hit._on_HitBox_area_entered(ray)

func _on_Sprite_animation_finished():
	sprite.play('Idle')
	sprite.playing = false
