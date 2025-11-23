extends Area2D

@export var speed := 1.5
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





func _on_area_entered(area: Area2D) -> void:
	if area.has_method('handle_hit'):
		area.handle_hit()
		self.queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.has_method('player_hit'):
		if self.is_in_group('enemy'):
			body.player_hit()
			self.queue_free()
		elif self.is_in_group('forcefield'):
			pass
	elif body.has_method('handle_hit'):
		if self.is_in_group('enemy'):
			pass
		elif self.is_in_group('play'):
			body.handle_hit()
			self.queue_free()
