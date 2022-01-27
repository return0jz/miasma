extends PlayerState

func enter(data: Dictionary = {}):
	self.player.animated.play("idle")

func physics_update(delta):
	transitions()
		
	if self.player.is_on_floor() == false:
		if self.player.play_attack:
			self.player.animated.play("jump_attack")
		else:
			self.player.animated.play("jump")
	elif self.player.is_on_floor():
		if self.player.play_attack:
			self.player.animated.play("idle_attack")
		else:
			self.player.animated.play("idle")
	

func transitions():
	if Input.is_action_just_pressed("jump") && self.player.is_on_floor():
		self.state_machine.transition_to("Jump")
	elif Global.get_movement_dir():
		self.state_machine.transition_to("Walk")
