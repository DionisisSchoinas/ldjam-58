extends VBoxContainer

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

func hightlight_next():
	key_selected(selected_key+1)
	
func hightlight_prev():
	key_selected(selected_key-1)

func wrap_selected_index(index: int) -> int:
	if index < 0:
		return keys.size()-1
	elif index > keys.size()-1:
		return 0
	else:
		return index
