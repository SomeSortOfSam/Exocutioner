extends Spatial

onready var animator : AnimationPlayer = $AnimationPlayer

export var speed : float = 30.0

var expoldeing := false

func _process (delta) :
	if !expoldeing:
		translation += global_transform.basis.z * speed * delta

func _on_Granade_collision(_collider):
	animator.play('Explode')
	expoldeing = true

func _on_Timer_timeout():
	animator.play('Explode')
	expoldeing = true


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
