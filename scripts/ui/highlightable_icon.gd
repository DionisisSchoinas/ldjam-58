extends TextureRect

@export var text = "btn"

@onready var label: Label = %Label

func _ready():
	label.text = text

func highlight():
	modulate = Color.AQUA

func unhighlight():
	modulate = Color.WHITE
