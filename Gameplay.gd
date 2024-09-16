class_name Gameplay extends Node2D

var grid_size : int = 32 
var time_between_moves: float = 1000.0 #ms
var time_since_last_move:float = 0
var speed:float = 1000.0
var move_dir:Vector2 = Vector2.RIGHT #Vector2(1,0)

@onready var head : Head = %HEAD as Head

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if( Input.is_action_pressed("ui_up")):
		move_dir = Vector2.UP #Vector2(0,-1)
	elif (Input.is_action_pressed("ui_down")):
		move_dir = Vector2.DOWN #Vector2(0,1)
	elif (Input.is_action_pressed("ui_right")):
		move_dir = Vector2.RIGHT #Vector2(1,0)
	elif (Input.is_action_pressed("ui_left")):
		move_dir = Vector2.LEFT #Vector2(-1,0)

func _physics_process(delta):
	time_since_last_move += delta * speed
	if time_since_last_move >= time_between_moves:
		update_snake()
		time_since_last_move = 0

func update_snake():
	var new_position : Vector2 = head.position + move_dir * grid_size
	head.move_to(new_position)
	 
