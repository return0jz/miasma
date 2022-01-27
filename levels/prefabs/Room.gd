extends Area2D

signal enter
signal exit

func _on_Room_area_entered(area):
	if area.is_in_group("RoomObserverGroup"):
		emit_signal("enter")

func _on_Room_area_exited(area):
	if area.is_in_group("RoomObserverGroup"):
		emit_signal("enter")
