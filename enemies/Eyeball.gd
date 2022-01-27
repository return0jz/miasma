extends Enemy

export(int) var speed

func _physics_process(delta):
	if Global.player_instance:
		var velocity = global_position.direction_to(Global.player_instance.global_position)
		self.move_and_collide(velocity * speed*delta);
		look_at(Global.player_instance.global_position)
