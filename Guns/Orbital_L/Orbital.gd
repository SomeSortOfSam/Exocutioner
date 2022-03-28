extends Spatial

onready var sprite : AnimatedSprite = $CanvasLayer/Control/Sprite

export (PackedScene) var granade

func _ready():
	sprite.frame = 0
	sprite.play('Idle')
	

func _unhandled_input(event):
	if event.is_action_pressed('shoot'):
		shoot()

func shoot():
	sprite.play('Shoot')
	sprite.frame = 0
	var granadeInstance : Spatial = granade.instance()
	granadeInstance.transform = global_transform
	get_tree().get_root().add_child(granadeInstance)


func _on_Sprite_animation_finished():
	sprite.play('Idle')
