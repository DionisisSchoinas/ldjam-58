extends Control

@export var id: int

@onready var highlightable_icon: Control = %highlightable_icon

func _ready():
	highlightable_icon.id = id
	highlightable_icon.label.text = GlobalKeySelector.keys.get(highlightable_icon.id)._key_action_button

func highlight():
	highlightable_icon.highlight()

func unhighlight():
	highlightable_icon.unhighlight()
