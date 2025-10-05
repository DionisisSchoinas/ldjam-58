extends Control

@onready var key_container: Control = %keyContainer
@onready var power_container: Control = %powerContainer

func _ready() -> void:
	key_container.connect("key_selected", power_container.key_selected)
	power_container.connect("power_selected", key_container.power_selected)
