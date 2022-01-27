extends FSM

var can_attack : bool = true

func _physics_process(delta):
	if self.can_attack:
		if Input.is_action_just_pressed("weapon0"):
			transition_to("None")
		if Input.is_action_just_pressed("weapon1") && has_node("Claw") && Global.player_instance.state_info.can_claw:
			transition_to("Claw")

func _process(delta):
	if Input.is_action_just_pressed("attack") && can_attack:
		self.state.attack()
