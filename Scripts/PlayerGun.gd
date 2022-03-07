extends Spatial

export var bullet : PackedScene 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _unhandled_input(event):
	if event.is_action_pressed("shoot"):
		shoot()

func shoot ():
	var bulletThing = bullet.instance()
	bulletThing.transform = transform
	get_tree().get_root().add_child(bulletThing)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
