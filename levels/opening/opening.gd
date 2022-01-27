extends Node2D

func _on_Switch_timeout():
	get_tree().change_scene("res://levels/level1/level1.tscn")


func _on_DialogueLayer_terminate():
	$Switch.start()
	$Fade.play("Fadeout")
