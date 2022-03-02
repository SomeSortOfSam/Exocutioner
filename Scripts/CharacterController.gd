extends KinematicBody
class_name CharacterController

export var speed := 1.0
export var gravity := 1.0

var velocity := Vector3.ZERO

func request_movement(requested_movement: Vector2):
	var realitive_motion = transform.basis.x * requested_movement.x * speed
	realitive_motion += transform.basis.z * requested_movement.y * speed
	velocity += realitive_motion

func _physics_process(_delta):
	velocity -= transform.basis.y * gravity
	velocity = move_and_slide(velocity, transform.basis.y)
	velocity = lerp(velocity,Vector3.ZERO,.1)
	
	if is_on_floor():
		transform.basis.y = get_floor_normal()
		var collider :Spatial = get_last_slide_collision().collider.get_parent()
		transform.basis.x = transform.basis.y.cross(collider.transform.basis.z)
		
