extends Control

@export var id: int

@onready var highlightable_icon: Control = %highlightable_icon

func _ready():
	highlightable_icon.id = id
	highlightable_icon.label.text = GlobalKeySelector.powers.get(highlightable_icon.id)._name

func highlight():
	highlightable_icon.highlight()

func unhighlight():
	highlightable_icon.unhighlight()
