extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.has_method('shield'):
		body.shield()
		self.queue_free()
	else:
		pass
