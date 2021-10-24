# Credit to GDQuest for quick FSM utility script

class_name FSM
extends Node

signal transitioned(name)

export var initial_path := NodePath() # Allow initial scene to be set in editor
onready var state : State = get_node(initial_path)

func _ready() -> void:
	print(self.name + "FSM initialized")
	yield(owner, "ready") # wait until owner is initialized
	for child in get_children():
		child.state_machine = self
	state.enter({})

func _process(delta) -> void:
	state.update(delta)

func _physics_process(delta) -> void:
	state.physics_update(delta)

func transition_to(state_name: String, data: Dictionary = {}) -> void:
	if has_node(state_name):
		state.exit()
		state = get_node(state_name)
		state.enter(data)
		emit_signal("transitioned", state.name)
	else:
		assert(false, "No state in FSM with that name")
	

