extends Control

@export var id: int
@export var texture: Texture

@onready var highlightable_icon: TextureRect = %highlightable_icon

func _ready():
	highlightable_icon.texture = texture
	highlightable_icon.label.text = GlobalKeySelector.keys.get(id)._key_action_button

func highlight():
	highlightable_icon.highlight()

func unhighlight():
	highlightable_icon.unhighlight()
