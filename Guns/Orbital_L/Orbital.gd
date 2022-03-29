extends Gun

export(PackedScene) var granade
export(Array,AudioStream) var shoot_sounds

func _shoot():
	sprite.play('Shoot')
	sprite.frame = 0
	if shoot_sounds.size() > 0:
		sounds.stream = shoot_sounds[randi() % shoot_sounds.size()]
		sounds.play()
	var granadeInstance : Spatial = granade.instance()
	granadeInstance.transform = global_transform
	get_tree().get_root().add_child(granadeInstance)

func _on_Sprite_animation_finished():
	sprite.play('Idle')
