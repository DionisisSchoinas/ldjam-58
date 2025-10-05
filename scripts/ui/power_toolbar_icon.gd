extends Control

@export var id: int
@export var texture: Texture

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var highlightable_icon: TextureRect = %highlightable_icon
@onready var key_icon: TextureRect = %key_icon

func _ready() -> void:
	key_icon.texture = texture

func highlight():
	highlightable_icon.highlight()

func unhighlight():
	highlightable_icon.unhighlight()
