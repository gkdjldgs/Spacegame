extends Node2D
class_name Weapon


@export var bullet = preload('res://scripts/bullet.tscn')
@onready var gunend = $Marker2D
@onready var gundirection = $Marker2D2
@onready var AttackCooldown = $Timer


func shoot():
	if AttackCooldown.is_stopped():
		var bullet_instance = bullet.instantiate()
		var direction = (gundirection.global_position - gunend.global_position).normalized()
		autoload.emit_signal("bullet_fired",bullet_instance,gunend.global_position,direction)
		AttackCooldown.start()
	else:
		pass
