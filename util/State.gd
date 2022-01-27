class_name State
extends Node

var state_machine = null; # set in FSM

func update(_delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass

func enter(data: Dictionary = {}) -> void:
	pass
	
func exit() -> void:
	pass
