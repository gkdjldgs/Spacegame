extends Node

@onready var limit = autoload.spawnlocation
@onready var limit1 = autoload.limit1
@onready var limit2 = autoload.limit2
var location = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func randomizer(): 
	var gamba = randi_range(0,1)	
	if limit == 1:
		location.x = randi_range(-155, 147)
		location.y = randi_range(-194, -134)
	elif limit == 2:
		if gamba == 0:
			location.x = randi_range(-155, 147)
			location.y = randi_range(-194, -134)
		elif gamba == 1:
			location.x = randi_range(-211, 210)
			location.y = randi_range(0, 105)
	elif limit == 3:
		if gamba == 0:
			location.x = randi_range(-155, 147)
			location.y = randi_range(-194, -134)
		elif gamba == 1:
			location.x = randi_range(-123, 120)
			location.y = randi_range(106, 190)

func _on_alien_timer_timeout() -> void:
	pass


func _on_ufotimer_timeout() -> void:
	pass # Replace with function body.
