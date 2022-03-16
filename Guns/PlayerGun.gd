extends Spatial

export var bullet_scene : PackedScene 

func _unhandled_input(event):
	if event.is_action_pressed("shoot"):
		shoot()

func shoot ():
	var bullet : Spatial = bullet_scene.instance()
	bullet.transform = global_transform
	get_tree().get_root().add_child(bullet)
