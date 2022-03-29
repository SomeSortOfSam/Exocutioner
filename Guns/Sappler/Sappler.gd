extends Gun

onready var ray : RayCast = $RayCast
onready var timer : Timer = $Timer
onready var wait_time = timer.wait_time

export var bullet_hole : PackedScene

var shooting : bool

func _unhandled_input(event):
	._unhandled_input(event)
	if event.is_action_released("shoot"):
		stop_shooting()

func _shoot():
	shooting = true
	sprite.frame = 0
	sprite.play("Shooting")
	sounds.play()
	timer.start(0)
	timer.wait_time = wait_time

func stop_shooting():
	sounds.stop()
	shooting = false
	sprite.play("EndShooting")
	timer.stop()

func _on_Timer_timeout():
	if ray.is_colliding() and bullet_hole:
		make_bullet_hole(ray.get_collision_normal(),ray.get_collision_point(),\
			ray.get_collider(),bullet_hole)
		var hit : Node = ray.get_collider().get_parent()
		if hit.has_method("_on_HitBox_area_entered"):
			hit._on_HitBox_area_entered(ray)

static func make_bullet_hole(normal : Vector3, point : Vector3, collider : Spatial, bullet_hole):
	var hole : Spatial = bullet_hole.instance(PackedScene.GEN_EDIT_STATE_INSTANCE)
	hole.translate(point + (normal * .01))
	hole.transform.basis.y = normal
	hole.transform = hole.transform.orthonormalized()
	hole.transform = hole.transform.looking_at(hole.translation - hole.transform.basis.z,\
		 normal)
	collider.add_child(hole)

func _on_Sprite_animation_finished():
	if sprite.animation == "EndShooting":
		sprite.play("Idle")
