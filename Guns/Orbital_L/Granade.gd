extends RigidBody

onready var animator : AnimationPlayer = $AnimationPlayer

export var speed : float = 30.0

var expoldeing := false

func _ready():
	linear_velocity = global_transform.basis.z * speed 

func _on_Granade_collision(_collider):
	animator.play('Explode')
	expoldeing = true

func _on_Timer_timeout():
	animator.play('Explode')
	expoldeing = true

func _on_AnimationPlayer_animation_finished(_anim_name):
	queue_free()
