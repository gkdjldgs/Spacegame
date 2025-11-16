extends Node2D
@onready var bullet_manager = $Manager
@onready var player: Player = $player
	
func _ready() -> void:
	autoload.connect("bullet_fired",bullet_manager.handle_bullet_spawned)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
