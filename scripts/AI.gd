extends Node2D

signal state_changed(new_state)

@onready var detection = $Detectioner
@onready var clone = $NODE2D

var target: CharacterBody2D

enum State  {
	LOOK,
	ATTACK
}

var current_state: int = State.LOOK : set = set_state
var player: Player = null
var weapon: Weapon = null

func _process(delta: float) -> void:
	match current_state:
		State.LOOK:
			pass
		State.ATTACK:
			if player != null and weapon != null:
				weapon.shoot()
			else:
				print('no weapon or player')
		_:
			print('nostateforenemy')
			
func set_weapon(weapon: Weapon):
	self.weapon = weapon

func set_state(new_state: int):
	if new_state == current_state:
		return
		
	current_state = new_state
	emit_signal('state_changed', current_state)

func _on_detectioner_body_entered(body: Node) -> void:
	if body.is_in_group('play'):
		print('sad')
		set_state(State.ATTACK)
		player = body
