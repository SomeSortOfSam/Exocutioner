extends Spatial
class_name Gun

export(Resource) var gun_kind

func shoot ():
	if gun_kind:
		if gun_kind.bullet:
			var bullet : Spatial = gun_kind.bullet.instance()
			bullet.transform = global_transform
			get_tree().get_root().add_child(bullet)
		else:
			print('histscan')

