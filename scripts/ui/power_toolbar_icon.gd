extends MarginContainer

@export var text = "btn"

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var label: Label = %Label

func _ready():
	label.text = text

func _process(_delta):
	if Input.is_action_just_pressed("button_1"):
		animation_player.play("equip")
