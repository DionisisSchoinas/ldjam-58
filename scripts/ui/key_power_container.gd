extends Container

@onready var settings_menu: Container = %settingsMenuMarginContainer
@onready var key_power_container: Container = %keyPowerContainer

var key_powers = []

func _ready():
	var containers = get_children(true)
	for icon in containers:
		key_powers.append_array(icon.get_children(true))
	connect("visibility_changed", update_ui)
	update_ui()
	
#func _process(_delta):
	#if Input.is_action_just_pressed("button_1"):
		#animation_player.play("equip")

func update_ui():
	print("update_ui")
	for key_panel in key_powers:
		var key = GlobalKeySelector.keys.get(key_panel.id)
		if key._unlocked:
			if key.has_power():
				key_panel.highlightable_icon.texture = get_power_texture(key._power._id)
			else:
				key_panel.highlightable_icon.texture = get_power_texture(GlobalKeySelector.POWER.NO_POWER)
		else:
			key_panel.highlightable_icon.texture = get_power_texture(GlobalKeySelector.POWER.NO_POWER)

func get_power_texture(index: int) -> Texture:
	return settings_menu.power_container.powers.get(index).highlightable_icon.texture
