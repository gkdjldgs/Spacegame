extends Node


@onready var damage = 1
@onready var score = 0
@onready var player_position = Vector2(0,0)
@onready var limit1 = 0
@onready var limit2 = 0
@onready var spawnlocation := 1
@onready var group = false
@onready var playerhealth := 0
@onready var intials = true
@onready var death = false
@onready var highscore = 0
@onready var wave = 1
signal bullet_fired(bullet, position, direction, group)

func _process(delta: float) -> void:
	if score > highscore:
		highscore = score
	else:
		pass
	
	
func _on_detection_1_body_entered(body: Node2D) -> void:
	if body.has_method('player_hit'):
		spawnlocation = 3

func _on_detection_2_body_entered(body: Node2D) -> void:
	if body.has_method('player_hit'):
		spawnlocation = 4
		
func _on_detection_3_body_entered(body: Node2D) -> void:
	if body.has_method('player_hit'):
		spawnlocation = 2

func _on_detection_4_body_entered(body: Node2D) -> void:
	if body.has_method('player_hit'):
		spawnlocation = 1


func _on_timer_timeout() -> void:
	if wave < 7:
		autoload.wave += 1
	else:
		pass
