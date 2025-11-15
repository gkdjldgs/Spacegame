extends Node2D
@onready var bullet_manager = $Manager
@onready var player: Player = $Player
	
func _ready() -> void:
	player.connect("bulletfired",bullet_manager.handle_bullet_spawned)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
