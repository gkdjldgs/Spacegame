extends Area2D

@export var speed := 300
var direction := Vector2(0,0)

func _process(delta: float) -> void:
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		
		global_position += velocity
	
func set_direction(direction: Vector2):
	self.direction = direction
