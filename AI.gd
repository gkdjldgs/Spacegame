extends Node2D
@onready var detection = $Area2D/detection
signal state_changed(new_state)
@onready var player = $Player

enum State{
	LOOK,
	ATTACK
}

var current_state: int = State.LOOK: set = set_state

func set_state(new_state: int):
	if new_state == current_state:
		return
		
	current_state = new_state
	emit_signal('state_changed', current_state)
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
