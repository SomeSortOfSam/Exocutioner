extends Gun

onready var sprite : AnimatedSprite = $CanvasLayer/Control/Sprite
onready var cursor : TextureRect = $CanvasLayer/Cursor

func _ready():
	if gun_kind:
		sprite.frames = gun_kind.animations
		sprite.play('Idle')
		cursor.texture = gun_kind.cursor

func _unhandled_input(event):
	if event.is_action_pressed("shoot"):
		shoot()
	if event.is_action_released("shoot") and gun_kind.automatic:
		stop_shooting()

func stop_shooting():
	.stop_shooting()
	sprite.play("EndShooting")

func shoot():
	if .shoot():
		sprite.play("Shooting" if gun_kind.automatic else "Shoot")
		if !gun_kind.automatic:
			sprite.frame = 0

func _on_Sprite_animation_finished():
	if sprite.frames and sprite.animation in ["Shoot", "EndShooting"]:
		sprite.play('Idle')
