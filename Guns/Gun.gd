extends Resource
class_name Gun

export(PackedScene) var bullet # leave empty for hitscan
export(Array,String) var shot_names # leave empty for 'Shoot'
export(SpriteFrames) var animations

func get_shot() -> String:
	if shot_names.size() > 0:
		return shot_names[randi() % len(shot_names)]
	return 'Shoot'
