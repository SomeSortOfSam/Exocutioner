extends Spatial
class_name Gun

onready var sounds : AudioStreamPlayer3D = $GunSounds

export(Resource) var gun_kind

var shooting := false

func shoot() -> bool:
	if gun_kind and !shooting:
		if gun_kind.bullet:
			var bullet : Spatial = gun_kind.bullet.instance()
			bullet.transform = global_transform
			get_tree().get_root().add_child(bullet)
		else:
			print('histscan')
		sounds.stream = gun_kind.get_shot_sound()
		if sounds.stream:
			sounds.play()
			shooting = true
		return true
	return false

func _on_GunSounds_finished():
	shooting = false
