extends Control

@export var id : int

@onready var label: Label = %Label

func highlight():
	modulate = Color.AQUA

func unhighlight():
	modulate = Color.WHITE
