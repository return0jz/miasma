class_name Player
extends KinematicBody2D

# References

export(NodePath) var animated_path
export(NodePath) var coll_shape_path
export(NodePath) var camera_path
export(NodePath) var room_observer_path
export(NodePath) var state_info_path

onready var animated = get_node(animated_path)
onready var coll_shape = get_node(coll_shape_path)
onready var camera = get_node(camera_path)
onready var room_observer = get_node(room_observer_path)
onready var state_info = get_node(state_info_path)

# Config

export var speed: float
export var gravity: float
export var fall_clamp: float
export var jump_dur: int
export var jump_speed: float
export var jump_release_speed: float

var vel : Vector2 = Vector2(0,0)

var dir: float = -1.0
var old_dir: float = -1.0

func _ready():
	Global.player_instance = self

func _physics_process(delta):
	if (Input.is_action_pressed("move_left")):
		dir = -1.0
	if (Input.is_action_pressed("move_right")):
		dir = 1.0
	vel.y += gravity * delta;
	vel.y = clamp(vel.y, vel.y, fall_clamp)
	vel = move_and_slide(vel, Vector2(0,-1))

	if (dir != old_dir):
		scale.x *= -1
	old_dir = dir
	pass

func _on_RoomObserver_area_entered(area): # Camera stuff
	var area_coll_shape = area.get_node("CollisionShape2D")
	var size = area_coll_shape.shape.extents
	camera.limit_top = area_coll_shape.global_position.y - size.y
	camera.limit_left = area_coll_shape.global_position.x - size.x
	camera.limit_right = camera.limit_left + size.x*2
	camera.limit_bottom = camera.limit_top + size.y*2
	pass # Replace with function body.
