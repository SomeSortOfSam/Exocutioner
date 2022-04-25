extends CharacterController

onready var camera = $Camera
onready var hurt_texture = $CanvasLayer/HurtTexture

export var health := 3 setget set_health

var prev_rot : Vector3
var max_health = health

func _process(_delta):
	if prev_rot.distance_squared_to(transform.basis.y) >= .001*.001:
		var angle = prev_rot.signed_angle_to(transform.basis.y, -transform.basis.x)
		camera.rotate_x(angle)
		camera.rotation.x = clamp(camera.rotation.x,-PI/2,PI/2)
	prev_rot = transform.basis.y

func _physics_process(_delta):
	var x = Input.get_axis("ui_left","ui_right")
	var y = Input.get_axis("ui_up","ui_down")
	var realitive_movement = Vector2(x,y)
	request_movement(realitive_movement)

func set_health(new_health):
	health = new_health
	hurt_texture.modulate.a = inverse_lerp(max_health,0,health)
	if health <= 0:
		get_tree().change_scene("res://World.tscn")

func _on_Camera_rotation_requested(amount):
	rotate(transform.basis.y, amount)

func _on_HitBox_area_entered(area):
	self.health -= 1
