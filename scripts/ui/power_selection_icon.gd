extends "highlightable_icon.gd"

@onready var highlightable_icon: Control = %highlightable_icon

func _ready():
	highlightable_icon.label.text = GlobalKeySelector.powers.get(id)._name
