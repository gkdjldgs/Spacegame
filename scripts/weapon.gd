extends Node2D
class_name Weapon

signal weapon_fired(bullet, location, direction)
@export var bullet = preload('res://scripts/bullet.tscn')
@onready var gunend = $Marker2D
@onready var gundirection = $Marker2D2
@onready var AttackCooldown = $Timer


func shoot():
	if AttackCooldown.is_stopped():
		var bullet_instance = bullet.instantiate()
		var direction = (gundirection.global_position - gunend.global_position).normalized()
		emit_signal("weapon_fired",bullet_instance,gunend.global_position,direction)
		AttackCooldown.start()
	else:
		pass
