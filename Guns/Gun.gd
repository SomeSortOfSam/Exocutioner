extends Spatial
class_name Gun

onready var sprite : AnimatedSprite = $CanvasLayer/Control/Sprite
onready var sounds : AudioStreamPlayer3D = $GunSounds

func _unhandled_input(event):
	if event.is_action_pressed("shoot"):
		_shoot()

func _shoot():
	pass

func _on_Sprite_animation_finished():
	pass 
