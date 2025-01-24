extends Node2D

@export var car_scene: PackedScene
@export var truck_scene: PackedScene

const gridSize = 64
var laneStarts = []
var vels = [-150.0, 150.0, -150.0, 350.0, -150.0]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.start($PCStartPosition.position)
	laneStarts.push_back($StartLane1)
	laneStarts.push_back($StartLane2)
	laneStarts.push_back($StartLane3)
	laneStarts.push_back($StartLane4)
	laneStarts.push_back($StartLane5)
	
	_on_car_timer_timeout(1)

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


func _on_car_timer_timeout(lane) -> void:
	var car = truck_scene.instantiate() if lane == 5 else car_scene.instantiate()
	
	var start = laneStarts[lane-1]
	car.position = start.position
	car.const_vel = Vector2(vels[lane-1], 0.0)
	car.setFrame(8+lane)

	add_child(car)
