extends Area2D

var horz_vel
var startPos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	horz_vel = Vector2(0, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += horz_vel * delta


func start(pos) -> void:
	startPos = pos
	position = startPos
	show()

func _on_area_entered(area: Area2D) -> void:
	# print("dead.")
	position = startPos

func setHorzVel(vel) -> void:
	horz_vel = Vector2(vel, 0)
