extends CanvasLayer

func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	$Control/ProgressBar.value = owner.state_info.health
	$Control/ProgressBar.max_value = owner.state_info.max_health
