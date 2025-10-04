extends MarginContainer

@onready var animation_player: AnimationPlayer = %AnimationPlayer

func _process(_delta):
	if Input.is_action_just_pressed("button_1"):
		animation_player.play("equip")
