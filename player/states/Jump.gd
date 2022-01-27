extends PlayerState
var is_held : bool = false
var jump_counter : float = 0.0

func enter(data: Dictionary = {}):
	is_held = true
	jump_counter = float(self.player.jump_dur)/1000 # jump_dur in milliseconds
	self.player.vel.y = -self.player.jump_speed
	self.player.animated.play("jump")
	self.player.jump_sound.play()

func physics_update(delta: float):
	if player.play_attack:
		self.player.animated.play("jump_attack")
	else:      
		self.player.animated.play("jump")
		
	if (self.jump_counter) <= 0 || Input.is_action_just_released("jump"):
		is_held = false
	if Input.is_action_just_released("jump") && (self.player.vel.y < -self.player.jump_release_speed):
		self.player.vel.y = -self.player.jump_release_speed
	if is_held && Input.is_action_pressed("jump"):
		self.player.vel.y = -self.player.jump_speed
		jump_counter -= delta
		
	self.player.vel.x = Global.get_movement_dir() * self.player.speed
	if (self.player.is_on_floor()):
		is_held = false;
		if Global.get_movement_dir():
			self.state_machine.transition_to("Walk")
		else:
			self.state_machine.transition_to("Idle")
