extends Node2D

var current_level: Node2D
var camera
func _ready() -> void:
	camera = $Camera2D
	
func switch_current_level(level_ref: Node2D):
	print(level_ref)
	current_level = level_ref
	if camera:
		camera._set_camera_limits_from_bounds()
