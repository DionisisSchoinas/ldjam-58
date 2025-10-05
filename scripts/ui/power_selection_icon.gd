extends Control

@export var id: int
@export var texture: Texture

@onready var highlightable_icon: TextureRect = %highlightable_icon

func _ready():
	if texture != null:
		highlightable_icon.texture = texture
	highlightable_icon.label.text = GlobalKeySelector.powers.get(id)._name

func highlight():
	highlightable_icon.highlight()

func unhighlight():
	highlightable_icon.unhighlight()
