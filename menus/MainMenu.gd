extends Control
var not_pressed = true

func _on_Start_button_up():
	if not_pressed:	
		$StartAnimation.play("Fadeout")
		$StartTimer.start()
		not_pressed = false

func _on_Quit_button_up():
	get_tree().quit()

func _physics_process(delta):
	$Background.rect_rotation = sin(Global.elapsed_time/5) * 360
	pass


func _on_StartTimer_timeout():
	get_tree().change_scene("res://levels/opening/opening.tscn")
