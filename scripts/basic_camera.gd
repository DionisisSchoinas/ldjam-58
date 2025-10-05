extends Camera2D

var player:Player
@export var follow_player: bool = false 

func _ready():
	var players = get_tree().get_nodes_in_group("Player")
	#_set_camera_limits_from_bounds()
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
		var top_left_anchor =get_parent().current_level.get_node("CollisionShape2D").global_position - shape.extents
		print(get_parent().current_level.position)
		limit_left   = int(top_left_anchor.x)
		limit_top    = int(top_left_anchor.y)
		limit_right  = int(top_left_anchor.x + rect_size.x)
		limit_bottom = int(top_left_anchor.y + rect_size.y)

func _process(_delta):
	#_set_camera_limits_from_bounds()
	position = player.global_position
