extends VBoxContainer

var keys = []
var selected_key

func _ready() -> void:
	var containers = get_children(true)
	for icon in containers:
		keys.append_array(icon.get_children(true))
	connect("visibility_changed", highlight_first)
	
func _input(event: InputEvent):
	if event.is_action_pressed("d_left"):
		hightlight_prev(1)
	elif event.is_action_pressed("d_right"):
		hightlight_next(1)
	elif event.is_action_pressed("d_up"):
		if (selected_key == 6):
			hightlight_prev(2)
		else:
			hightlight_prev(3)
	elif event.is_action_pressed("d_down"):
		hightlight_next(3)

func key_selected(index: int):
	if keys == null || keys.is_empty():
		pass
	if (selected_key != null):
		keys.get(selected_key).unhighlight()
	selected_key = wrap_selected_index(index)
	keys.get(selected_key).highlight()

func highlight_first():
	if (visible):
		key_selected(0)

func hightlight_next(index: int):
	key_selected(selected_key+index)
	
func hightlight_prev(index: int):
	key_selected(selected_key-index)

func wrap_selected_index(index: int) -> int:
	if index < 0:
		return 0
	elif index > keys.size()-1:
		return keys.size()-1
	else:
		return index
