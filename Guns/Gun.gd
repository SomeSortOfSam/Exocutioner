extends Spatial
class_name Gun

onready var sounds : AudioStreamPlayer3D = $GunSounds
onready var ray : RayCast = $RayCast
onready var shot_in_betweens = $ShotBetweens

export(Resource) var gun_kind

var shooting := false

func _ready():
	equip_gun_kind()

func equip_gun_kind():
	if gun_kind:
		if !gun_kind.bullet:
			ray.cast_to = ray.cast_to.normalized() * gun_kind.target_range

func stop_shooting():
	sounds.stop()
	shooting = false

func shoot() -> bool:
	var condition = gun_kind and (gun_kind.automatic or !sounds.playing)
	if condition:
		if gun_kind.bullet:
			var bullet : Spatial = gun_kind.bullet.instance()
			bullet.transform = global_transform
			get_tree().get_root().add_child(bullet)
		else:
			if ray.is_colliding():
				var collider = ray.get_collider()
				collider.get_parent().queue_free()
		sounds.stream = gun_kind.get_shot_sound()
		if sounds.stream and !sounds.playing:
			sounds.play()
			shot_in_betweens.start(sounds.stream.get_length())
		shooting = gun_kind.automatic
	return condition

func _on_ShotBetweens_timeout():
	if shooting:
		var _ignore = shoot()
