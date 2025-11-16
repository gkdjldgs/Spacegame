extends Area2D

@onready var player = preload("res://scripts/player.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

const speed = 10
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var velocity = (autoload.player_position - self.global_position).normalized() * speed
	print(velocity)
