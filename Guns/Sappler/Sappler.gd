extends Spatial

onready var sprite : AnimatedSprite = $CanvasLayer/Control/AnimatedSprite
onready var sounds : AudioStreamPlayer3D = $Sounds
onready var ray : RayCast = $RayCast
onready var timer : Timer = $Timer
onready var wait_time = timer.wait_time

export var bullet_hole :PackedScene

var shooting : bool

func _unhandled_input(event):
	if event.is_action_pressed("shoot"):
		shoot()
	if event.is_action_released("shoot"):
		stop_shooting()

func stop_shooting():
	sounds.stop()
	shooting = false
	sprite.play("EndShooting")
	timer.stop()

func shoot():
	shooting = true
	sprite.frame = 0
	sprite.play("Shooting")
	sounds.play()
	timer.start(0)
	timer.wait_time = wait_time

func _on_Timer_timeout():
	if ray.is_colliding() and bullet_hole:
		var hole : Spatial = bullet_hole.instance(PackedScene.GEN_EDIT_STATE_INSTANCE)
		hole.translate(ray.get_collision_point() + (ray.get_collision_normal() * .01))
		var angle = ray.get_collision_normal().signed_angle_to(hole.transform.basis.z, -hole.transform.basis.x)
		hole.rotate_x(angle)
		ray.get_collider().add_child(hole)
		var hit : Node = ray.get_collider().get_parent()
		if hit.has_method("_on_HitBox_area_entered"):
			hit._on_HitBox_area_entered(ray)

func _on_AnimatedSprite_animation_finished():
	if sprite.animation == "EndShooting":
		sprite.play("Idle")
