extends MarginContainer

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var highlightable_icon: TextureRect = $highlightable_icon

func _process(_delta):
	if Input.is_action_just_pressed("button_1"):
		animation_player.play("equip")

func highlight():
	highlightable_icon.highlight()

func unhighlight():
	highlightable_icon.unhighlight()
