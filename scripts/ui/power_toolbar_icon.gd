extends "highlightable_icon.gd"

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var highlightable_icon: Control = %highlightable_icon

func _ready():
	connect("visibility_changed", update_ui)
	update_ui()
	
func _process(_delta):
	if Input.is_action_just_pressed("button_1"):
		animation_player.play("equip")

func update_ui():
	var key = GlobalKeySelector.keys.get(id)
	if (key._unlocked):
		highlightable_icon.label.text = key._key_action_button + " |" + key._power._name + "|"
	else:
		highlightable_icon.label.text = "|X|"
