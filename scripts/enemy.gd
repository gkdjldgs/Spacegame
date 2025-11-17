extends Node2D

@onready var health = $health.health
@onready var bullet = preload('res://scripts/bullet.tscn')
@onready var AI = $AI
@onready var weapon = $weapon

func _ready() -> void:
	AI.initialize(self, weapon)

func handle_hit():
	health -= autoload.damage
	if health == 0:
		autoload.score += 200
		print(autoload.score)
		self.queue_free()
