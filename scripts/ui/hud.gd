extends Control

@onready var power_container: MarginContainer = %powerMarginContainer
@onready var settings_menu_container: MarginContainer = %settingsMenuMarginContainer

func _ready():
	power_container.visible = true
	settings_menu_container.visible = false
	get_tree().paused = false
	
func _input(event: InputEvent):
	if event.is_action_pressed("selection"):
		flip_ui()

func flip_ui():
	power_container.visible = !power_container.visible
	settings_menu_container.visible = !settings_menu_container.visible
	get_tree().paused = !get_tree().paused
