extends Node2D

signal state_changed(new_state)

@onready var detection = $Detectioner
var actor = null

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
				actor.rotation = actor.global_position.direction_to(player.global_position).angle()
				autoload.group = true
				weapon.shoot()
			else:
				print('no weapon or player')
		_:
			print('nostateforenemy')
			
func initialize(actor, weapon: Weapon):
	self.actor = actor
	self.weapon = weapon

func set_state(new_state: int):
	if new_state == current_state:
		return
		
	current_state = new_state
	emit_signal('state_changed', current_state)

func _on_detectioner_body_entered(body: Node) -> void:
	if body.is_in_group('play'):
		set_state(State.ATTACK)
		player = body




func _on_detectioner_body_exited(body: Node2D) -> void:
	if body.is_in_group('play'):
		set_state(State.LOOK)
		player = body
	
