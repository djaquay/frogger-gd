extends Area2D

@export var const_vel: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += const_vel * delta

func start(pos) -> void:
	position = pos
	show()

func setFrame(fr) -> void:
	$Sprite.frame = fr


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
