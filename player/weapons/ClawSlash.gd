extends Area2D

# References

onready var animated_sprite : AnimatedSprite = $SlashAnimation
export var speed : float = 50.0

var direction : float = false

var slash_frame : bool = false

func _ready():
	animated_sprite.play("slash1")

func _physics_process(delta):
	position.x += (delta*speed)*direction
	
func _on_Die_timeout():
	queue_free()

