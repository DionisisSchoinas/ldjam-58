extends Control

signal power_selected(power_index: int)

var powers = []
var selected_power_index

func _ready() -> void:
	var containers = get_children(true)
	for icon in containers:
		powers.append_array(icon.get_children(true))
	
func _input(event: InputEvent):
	if event.is_action_pressed("d_left"):
		hightlight_prev(1)
	elif event.is_action_pressed("d_right"):
		hightlight_next(1)
	elif event.is_action_pressed("d_up"):
		if (selected_power_index == 6):
			hightlight_prev(2)
		else:
			hightlight_prev(3)
	elif event.is_action_pressed("d_down"):
		hightlight_next(3)

func key_selected(index: int):
	var key_index = index
	if index < 0:
		key_index = GlobalKeySelector.keys.size()-1
	elif index > GlobalKeySelector.keys.size()-1:
		key_index = 0
	select_power(GlobalKeySelector.keys.get(wrap_selected_index(key_index))._power._id)
	
func select_power(index: int):
	if powers == null || powers.is_empty():
		pass
	if (selected_power_index != null):
		powers.get(selected_power_index).unhighlight()
	selected_power_index = wrap_selected_index(index)
	# Update UI
	powers.get(selected_power_index).highlight()
	power_selected.emit(selected_power_index)

func highlight_first():
	if (visible):
		select_power(0)

func hightlight_next(index: int):
	select_power(selected_power_index+index)
	
func hightlight_prev(index: int):
	select_power(selected_power_index-index)

func wrap_selected_index(index: int) -> int:
	if index < 0:
		return 0
	elif index > powers.size()-1:
		return powers.size()-1
	else:
		return index
