extends Camera2D

var player:Player

func _ready():
	var players = get_tree().get_nodes_in_group("Player")
	if players.size() > 0:
		player = players[0]
	else:
		push_warning("No player found in group 'player'!")

func _process(delta):
	if player:
		print(abs(position.x-player.global_position.x))
		position.x =  lerp(position.x,player.global_position.x + 500 * player.direction,0.005)
	
