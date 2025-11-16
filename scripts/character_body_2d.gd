extends CharacterBody2D
class_name Player

var speed = 60
@onready var health = $health
@onready var weapon = $weapon


func _process(delta: float) -> void:
	autoload.player_position = self.global_position
	look_at(get_global_mouse_position())
	if health.health == 0:
		pass
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
		weapon.shoot()
		
func player_hit():
	health.health -= 1
