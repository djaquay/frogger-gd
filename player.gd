extends Area2D

var horz_vel
var lane
var startPos
var aboveWater: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	horz_vel = Vector2(0, 0)
	lane = 0
	aboveWater = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += horz_vel * delta
	if lane > 6 and !aboveWater:
		print("player _process drowning")
		position = startPos
		aboveWater = true


func start(pos) -> void:
	startPos = pos
	position = startPos
	show()

func _on_area_entered(area: Area2D) -> void:
	if lane < 6:
		print("player oaEn: dead.")
		print(area.name)
		position = startPos
	elif area.name.begins_with("Turtle"):
		print("player oaEn: on a turtle")
		aboveWater = true
	elif area.name.begins_with("Log"):
		print("please oaEn: on a log")
		aboveWater = true

func _on_area_exited(area: Area2D) -> void:
	print("player oaEx: off of " + area.name)
	if lane > 6:
		aboveWater = false

func setHorzVel(vel, pLane) -> void:
	horz_vel = Vector2(vel, 0)
	lane = pLane
	if lane <= 6:
		aboveWater = true
