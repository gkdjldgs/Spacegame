extends CharacterBody2D
class_name Player

var speed = 60
@onready var health = $health.health
@onready var weapon = $weapon

func healthy():
	if health != autoload.playerhealth:
		autoload.playerhealth = health

func _process(delta: float) -> void:
	autoload.player_position = self.global_position
	look_at(get_global_mouse_position())

func _physics_process(delta: float) -> void:
	var strafe = Vector2(Input.get_axis('left',"right",),
	Input.get_axis('up','down'))

	if strafe != Vector2.ZERO:
		velocity = speed * strafe.normalized()
		
	else:
		velocity.x = move_toward(velocity.x,0,speed)
		velocity.y = move_toward(velocity.y,0,speed)
		
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("click"):
		autoload.group = false
		weapon.shoot()
		
func player_hit():
	if $Timer.is_stopped():
		health -= 1
		healthy()
		$CanvasLayer.heartcheck()
		if health == 0:
			get_tree().change_scene_to_file('res://death.tscn')
	else:
		$Timer.start()
