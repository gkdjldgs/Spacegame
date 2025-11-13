extends Area2D

@export var speed := 3.5
var direction := Vector2(0,0)

func _physics_process(delta: float) -> void:
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		
		global_position += velocity
	
func set_direction(direction: Vector2):
	self.direction = direction
	rotation += direction.angle()


func _on_timer_timeout() -> void:
	self.queue_free()
