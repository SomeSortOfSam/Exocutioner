extends Area

var speed : float = 30.0

func _process (delta) :
	translation += global_transform.basis.z * speed * delta

func _destroy () :
	queue_free()

