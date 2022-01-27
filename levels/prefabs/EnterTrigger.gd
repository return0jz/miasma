extends Area2D

signal triggered

func _on_Area2D_body_entered(body):
	if body.is_in_group("trigger"):
		emit_signal("triggered")
