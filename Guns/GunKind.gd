extends Resource
class_name GunKind

export(PackedScene) var bullet # leave empty for hitscan
export var target_range : float
export var automatic := false
export(Array,AudioStream) var shot_sounds
export(SpriteFrames) var animations
export var cursor : Texture

func get_shot_sound() -> AudioStream:
	if shot_sounds.size() > 0:
		return shot_sounds[randi() % len(shot_sounds)]
	return null
