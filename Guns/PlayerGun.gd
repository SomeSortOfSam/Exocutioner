extends Gun

onready var sprite : AnimatedSprite = $CanvasLayer/Control/Sprite

func _ready():
	if gun_kind:
		sprite.frames = gun_kind.animations
		sprite.play('Idle')

func _unhandled_input(event):
	if event.is_action_pressed("shoot"):
		var _moot = shoot()

func shoot() -> bool:
	if .shoot() and sprite.frames:
		sprite.play(gun_kind.get_shot_name())
		sprite.frame = 0
		return true
	return false


func _on_Sprite_animation_finished():
	if sprite.frames and sprite.animation != 'Idle':
		sprite.play('Idle')
