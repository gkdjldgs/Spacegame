extends Node2D
@onready var detection = $Area2D/detection
signal state_changed(new_state)
@onready var player = null

@onready var clone = $NODE2D
enum State{
	LOOK,
	ATTACK
}

var target: CharacterBody2D

var current_state: int = State.LOOK: set = set_state

func _process(delta: float) -> void:
	match current_state:
		State.LOOK:
			print('sad')
		State.ATTACK:
			if player != null:
				print('wow')
		_:
			pass
			print('nostateforenemy')
func set_state(new_state: int):
	if new_state == current_state:
		return
		
	current_state = new_state
	emit_signal('state_changed', current_state)
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group('player'):
		set_state(State.ATTACK)
		player = body
