extends KinematicBody
class_name CharacterController

func handle_movement(requested_movement: Vector2):
	move_and_collide(Vector3(requested_movement.x,0,requested_movement.y))
