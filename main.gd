extends Node2D

const gridSize = 64

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.start($StartPosition.position)

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
