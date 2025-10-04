extends Camera2D

var player:Player
@export var follow_player: bool = false 

func _ready():
	var players = get_tree().get_nodes_in_group("Player")
	_set_camera_limits_from_bounds()
	if players.size() > 0:
		player = players[0]
	else:
		push_warning("No player found in group 'player'!")
	
		
func _set_camera_limits_from_bounds():
	if not get_parent().current_level:
		push_warning("No CollisionShape2D found in Area2D!")
		return
	
	var shape = get_parent().current_level.get_node("CollisionShape2D").shape
	if shape is RectangleShape2D:
		var rect_size = shape.extents * 2
		var rect_pos = get_parent().current_level.global_position - shape.extents

		limit_left   = int(rect_pos.x)
		limit_top    = int(rect_pos.y-500)
		limit_right  = int(rect_pos.x + rect_size.x - 200)
		limit_bottom = int(rect_pos.y + rect_size.y - 500)
	
func _process(_delta):
	_set_camera_limits_from_bounds()
	position = player.global_position
