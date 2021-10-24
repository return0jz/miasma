extends Node

var player_instance = null; 

func _ready():
	pass # Replace with function body.

func get_movement_dir() -> float: # -1.0, 0.0, or 1.0
	var dir : float = 0.0
	if (Input.is_action_pressed("move_right")):
		dir += 1.0
	if (Input.is_action_pressed("move_left")):
		dir -= 1.0
	return dir
