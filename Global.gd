extends Node

var player_instance = null; 
var elapsed_time : float = 0.0

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS

func get_movement_dir() -> float: # -1.0, 0.0, or 1.0
	var dir : float = 0.0
	if (Input.is_action_pressed("move_right")):
		dir += 1.0
	if (Input.is_action_pressed("move_left")):
		dir -= 1.0
	return dir

func _process(delta):
	elapsed_time += delta

func save():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for i in save_nodes:
		assert(i.has_method("save"), "Node has no save method")
		var node_data = i.call("save")
		save_game.store_line(to_json(node_data))
	save_game.close()

	
