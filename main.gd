extends Node2D

@export var car_scene: PackedScene
@export var truck_scene: PackedScene
@export var turtle_scene: PackedScene
@export var log_scene: PackedScene

const gridSize = 64
var laneStarts = []
var vels = [-150.0, 150.0, -150.0, 350.0, -150.0, -100.0, -50.0, -75.0, -150.0, 0.0]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var pos = $PCStartPosition.position
	pos.y -= 64*6  # test code to get straight to the river
	$Player.start(pos)
	laneStarts.push_back($StartLane1)
	laneStarts.push_back($StartLane2)
	laneStarts.push_back($StartLane3)
	laneStarts.push_back($StartLane4)
	laneStarts.push_back($StartLane5)
	laneStarts.push_back($StartLane6)
	laneStarts.push_back($StartLane7)
	laneStarts.push_back($StartLane8)
	laneStarts.push_back($StartLane9)
	
	_on_car_timer_timeout(1)
	_on_car_timer_timeout(6)
	_on_car_timer_timeout(7)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("move_down"):
		moveY("move_down")
	if Input.is_action_just_pressed("move_up"):
		moveY("move_up")
	if Input.is_action_just_pressed("move_right"):
		$Player.position.x += gridSize
	if Input.is_action_just_pressed("move_left"):
		$Player.position.x -= gridSize
		
		
func moveY(action) -> void:
	if Input.is_action_just_pressed("move_down"):
		$Player.position.y += gridSize
	if Input.is_action_just_pressed("move_up"):
		$Player.position.y -= gridSize

	var pcLane = ($PCStartPosition.position.y - $Player.position.y) / 64
	if pcLane >= 12:
		# probably do home zone checks and logic here
		$Player.setHorzVel(0.0, pcLane)
	elif pcLane > 6:
		$Player.setHorzVel(vels[pcLane - 2], pcLane)
	else:
		$Player.setHorzVel(0.0, pcLane)
	print("moveY: ", pcLane)
	
	
func _on_car_timer_timeout(lane) -> void:
	var car = null
	if lane < 5:
		car = car_scene.instantiate()
	elif lane == 5:
		car = truck_scene.instantiate()
	elif lane == 6 or lane == 9:
		car = turtle_scene.instantiate()
	elif lane == 7 or lane == 8:
		car = log_scene.instantiate()
	# var car = truck_scene.instantiate() if lane == 5 else car_scene.instantiate()
	
	var start = laneStarts[lane-1]
	car.position = start.position
	car.const_vel = Vector2(vels[lane-1], 0.0)
	car.setFrame(8+lane)

	add_child(car)
