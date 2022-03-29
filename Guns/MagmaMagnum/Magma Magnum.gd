extends Spatial

onready var sprite : AnimatedSprite = $CanvasLayer/Control/AnimatedSprite
onready var sounds : AudioStreamPlayer3D = $AudioStreamPlayer3D
onready var hurtbox : Area = $Hurtbox
onready var hurt_timer : Timer = $HurtTimer

export(AudioStream) var shoot1_sound
export(AudioStream) var shoot2_sound
export(AudioStream) var reload_sound

var cur_shot := -1

func _unhandled_input(event):
	if event.is_action_pressed("shoot"):
		shoot()

func shoot():
	cur_shot += 1
	if sprite.animation != 'Reload' and cur_shot <= 1:
		sprite.play('Shoot' + str(cur_shot + 1))
		sounds.stream = shoot1_sound if cur_shot < 1 else shoot2_sound
		sounds.play()
		hurtbox.monitorable = true
		hurt_timer.start()

func reload():
	sprite.play('Reload')
	sounds.stream = reload_sound
	sounds.play()
	

func _on_AnimatedSprite_animation_finished():
	if sprite.animation == 'Reload':
		cur_shot = -1
	if sprite.animation == 'Shoot2':
		reload()
	else:
		sprite.play('Idle')

func _on_HurtTimer_timeout():
	hurtbox.monitorable = false
