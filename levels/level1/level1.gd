extends Node

func _ready():
	$Dialog1Delay.start()
	Global.save()

func _on_Dialog1Delay_timeout():
	var dialog1 = preload("res://levels/level1/level1_dialog1.tscn").instance();
	add_child(dialog1)

func _on_Question1_triggered():
	var gate_dialog = preload("res://levels/level1/level1_dialog_gate.tscn").instance()
	self.add_child(gate_dialog)


func _on_GetClaw1_triggered():
	Global.player_instance.state_info.can_claw = true
	var claw_dialog = preload("res://levels/level1/level1_dialog_claw.tscn").instance()
	self.add_child(claw_dialog)
