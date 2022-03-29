extends Spatial

onready var sprite : AnimatedSprite = $CanvasLayer/Control/Sprite
onready var sounds : AudioStreamPlayer3D = $GunSounds

export(PackedScene) var granade
export(Array,AudioStream) var shoot_sounds

func _ready():
	sprite.frame = 0
	sprite.play('Idle')

func _unhandled_input(event):
	if event.is_action_pressed('shoot'):
		shoot()

func shoot():
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
