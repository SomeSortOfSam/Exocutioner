extends Resource
class_name GunKind

export(PackedScene) var bullet # leave empty for hitscan
export var target_range : float
export(Array,String) var shot_names # leave empty for 'Shoot'
export(Array,AudioStream) var shot_sounds
export(SpriteFrames) var animations
export var cursor : Texture

func get_shot_name() -> String:
	if shot_names.size() > 0:
		return shot_names[randi() % len(shot_names)]
	return 'Shoot'

func get_shot_sound() -> AudioStream:
	if shot_sounds.size() > 0:
		return shot_names[randi() % len(shot_names)]
	return null
