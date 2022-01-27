extends WeaponState

export(NodePath) var heart_animated_path
export(NodePath) var attack_timer_path
export(NodePath) var delay_timer_path
export(NodePath) var hit_sound_path
export var bobble : float
export var damage : float

onready var heart_animated : AnimatedSprite = get_node(heart_animated_path) 
onready var attack_timer : Timer = get_node(attack_timer_path) 
onready var delay_timer : Timer = get_node(delay_timer_path) 
onready var hit_sound : AudioStreamPlayer = get_node(hit_sound_path)
onready var pivot = heart_animated.position

var slash : PackedScene = preload("res://player/weapons/ClawSlash.tscn");

func _ready():
	self.visible = false

func enter(data := {}):
	self.visible = true
	heart_animated.play("idle")

func exit():
	self.visible = false

func physics_update(delta):
	heart_animated.position.y = pivot.y + bobble*sin(Global.elapsed_time)
	heart_animated.rotation_degrees = bobble*Global.elapsed_time

func attack():
	hit_sound.play()
	player.play_attack = true
	state_machine.can_attack = false;
	
	var slash_instance = slash.instance()
	player.owner.add_child(slash_instance)
	slash_instance.transform = player.transform
	slash_instance.direction = player.dir
	attack_timer.start();

func _on_AttackTimer_timeout(): # Stop attacking (for animation)
	player.play_attack = false
	delay_timer.start()

func _on_DelayTimer_timeout(): # Wait time between attack button presses
	state_machine.can_attack = true
