class_name Enemy
extends KinematicBody2D

signal die;

export var max_health : float  = 100 # starting health, consistency with player
export var curr_health : float = 100

func attack(damage: float):
	curr_health-=damage

func _physics_process(delta):
	if (curr_health <= 0):
		emit_signal("die")
		self.queue_free()
