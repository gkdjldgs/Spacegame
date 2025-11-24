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
		var number = randi_range(1,10)
		var deathcation = self.global_position
		if number == 1:
				var item = preload('res://bulletupgrade.tscn')
				var items = item.instantiate()
				add_child(items)
				items.global_position = deathcation
				self.queue_free()
		elif number == 2:
				var item = preload('res://heart heal.tscn')
				var items = item.instantiate()
				add_child(items)
				items.global_position = deathcation
				self.queue_free()
		else:
			self.queue_free()
