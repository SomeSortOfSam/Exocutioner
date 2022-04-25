extends Gun

onready var hurtbox : Area = $Hurtbox
onready var hurt_timer : Timer = $HurtTimer
onready var hurshape : CollisionShape = $Hurtbox/CollisionShape
onready var ray : RayCast = $RayCast

export(AudioStream) var shoot1_sound
export(AudioStream) var shoot2_sound
export(AudioStream) var reload_sound
export(PackedScene) var bullet_hole

var cur_shot := -1

func _shoot():
	cur_shot += 1
	if sprite.animation != 'Reload' and cur_shot <= 1:
		sprite.play('Shoot' + str(cur_shot + 1))
		sounds.stream = shoot1_sound if cur_shot < 1 else shoot2_sound
		sounds.play()
		hurshape.disabled = false
		hurt_timer.start()
		emit_signal("recoil",Vector2(0,5))
		if ray.is_colliding():
			Sappler.make_bullet_hole(ray.get_collision_normal(),ray.get_collision_point(),\
				ray.get_collider(),bullet_hole)

func reload():
	sprite.play('Reload')
	sounds.stream = reload_sound
	sounds.play()

func _on_Sprite_animation_finished():
	if sprite.animation == 'Reload':
		cur_shot = -1
	if sprite.animation == 'Shoot2':
		reload()
	else:
		sprite.play('Idle')

func _on_HurtTimer_timeout():
	hurshape.disabled = true
