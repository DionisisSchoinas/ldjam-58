extends "highlightable_icon.gd"

@onready var highlightable_icon: Control = %highlightable_icon

func _ready():
	highlightable_icon.label.text = GlobalKeySelector.keys.get(id)._key_action_button
