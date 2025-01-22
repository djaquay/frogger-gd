extends Node2D

@export var car_scene: PackedScene

const gridSize = 64

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.start($PCStartPosition.position)
	_on_car_timer_timeout()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("move_down"):
		$Player.position.y += gridSize
	if Input.is_action_just_pressed("move_up"):
		$Player.position.y -= gridSize
	if Input.is_action_just_pressed("move_right"):
		$Player.position.x += gridSize
	if Input.is_action_just_pressed("move_left"):
		$Player.position.x -= gridSize


func _on_car_timer_timeout() -> void:
	var car = car_scene.instantiate()
	
	var car_spawn_location = $StartLane1
	
	var dir = PI
	car.position = car_spawn_location.position
	
	car.const_vel = Vector2(-150.0, 0.0)

	add_child(car)
