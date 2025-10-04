extends MarginContainer

@export var text = 1

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var label: Label = %Label

func _ready():
	label.text = str(text)

func _process(_delta):
	if Input.is_action_just_pressed("button_1"):
		animation_player.play("equip")
