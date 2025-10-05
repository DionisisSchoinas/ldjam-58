extends Control

@onready var power_container: Container = %powerMarginContainer
@onready var settings_menu_container: Container = %settingsMenuMarginContainer

func _ready():
	power_container.visible = true
	settings_menu_container.visible = false
	get_tree().paused = false
	
func _input(event: InputEvent):
	if event.is_action_pressed("selection"):
		flip_ui_visiblity()

func flip_ui_visiblity():
	power_container.visible = !power_container.visible
	settings_menu_container.visible = !settings_menu_container.visible
	get_tree().paused = !get_tree().paused
