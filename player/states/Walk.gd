extends PlayerState

func enter(data: Dictionary = {}):
	self.player.animated.play("walk")
	self.player.vel.x = Global.get_movement_dir() * self.player.speed

func physics_update(delta):
	transitions()
	self.player.vel.x = Global.get_movement_dir() * self.player.speed
	
	if self.player.is_on_floor() == false:
		self.player.animated.play("jump")
	elif self.player.is_on_floor():
		self.player.animated.play("walk")
		
func transitions():
	if Input.is_action_just_pressed("jump") && self.player.is_on_floor():
		self.state_machine.transition_to("Jump")
	elif Global.get_movement_dir() == 0.0:
		self.state_machine.transition_to("Idle")
