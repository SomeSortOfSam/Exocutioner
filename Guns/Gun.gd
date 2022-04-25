extends Spatial
class_name Gun

onready var sprite : AnimatedSprite = $CanvasLayer/Control/Sprite
onready var sounds : AudioStreamPlayer3D = $GunSounds
onready var cursor : TextureRect = $CanvasLayer/Cursor

signal recoil(amount)

func _unhandled_input(event):
	if cursor.visible:
		if event.is_action_pressed("shoot"):
			_shoot()

func _shoot():
	pass

func _on_Sprite_animation_finished():
	pass 
	
func _setvisible(newvisible):
	sprite.visible = newvisible
	cursor.visible = newvisible
	
