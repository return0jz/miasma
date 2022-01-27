extends ColorRect

func _process(delta):
	self.color = Color(sin(Global.elapsed_time), sin(Global.elapsed_time), sin(Global.elapsed_time), 1)
