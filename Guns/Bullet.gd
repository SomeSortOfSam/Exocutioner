extends Area
class_name Bullet

var speed : float = 30.0

func _process (delta) :
	translation += global_transform.basis.z * speed * delta

func destroy () :
	queue_free()

func _on_Bullet_body_entered(_body):
	queue_free()
