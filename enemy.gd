extends Node2D
var health = 5
@onready var bullet = preload('res://bullet.tscn')
@onready var AI = $AI
func handle_hit():
	health -= autoload.damage
	print("OW")
	if health == 0:
		autoload.score = 200
		print(autoload.score)
		self.queue_free()
