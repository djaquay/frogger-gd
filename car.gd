extends RigidBody2D

@export var const_vel: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	linear_velocity = const_vel


func start(pos) -> void:
	position = pos
	show()
