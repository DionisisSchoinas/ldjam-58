extends Node2D

var current_level: Node2D

func switch_current_level(level_ref: Node2D):
	print(level_ref)
	current_level = level_ref
