extends Control

signal key_selected(key_index: int)

var keys = []
var selected_key

func _ready() -> void:
	keys = get_children(true)
	connect("visibility_changed", highlight_first)
	
func _input(event: InputEvent):
	if event.is_action_pressed("button_1"):
		hightlight_prev()
	elif event.is_action_pressed("button_2"):
		hightlight_next()

func power_selected(index: int):
	GlobalKeySelector.keys.get(selected_key)._power = GlobalKeySelector.powers.get(index)

func select_key(index: int):
	if keys == null || keys.is_empty():
		pass
	if (selected_key != null):
		keys.get(selected_key).unhighlight()
	selected_key = wrap_selected_index(index)
	# Update UI
	keys.get(selected_key).highlight()
	key_selected.emit(index)

func highlight_first():
	if (visible):
		select_key(GlobalKeySelector.KEY.D_RIGHT_KEY_INDEX)

func hightlight_next():
	select_key(selected_key+1)
	
func hightlight_prev():
	select_key(selected_key-1)

func wrap_selected_index(index: int) -> int:
	if index < 0:
		return keys.size()-1
	elif index > keys.size()-1:
		return 0
	else:
		return index
