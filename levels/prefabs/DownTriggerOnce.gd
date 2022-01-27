extends Area2D
signal triggered

func trigger():
	emit_signal("triggered")
	queue_free()
