extends FSM

func _physics_process(delta):
	if Input.is_action_just_pressed("weapon0"):
		transition_to("None")
	if Input.is_action_just_pressed("weapon1") && has_node("Claw"):
		transition_to("Claw")
	pass
