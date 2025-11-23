extends CharacterBody2D
class_name Player

var speed = 60
var hit = false
@onready var health = $health.health
@onready var weapon = $weapon

func healthy():
	if health != autoload.playerhealth:
		autoload.playerhealth = health

func _ready() -> void:
	autoload.death = false
	autoload.intials = true
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
	if autoload.intials == false:
		if hit == false:
			hit = true
			health -= 1
			healthy()
			await $CanvasLayer.heartcheck()
			hit = false
			if health == 0:
				autoload.death = true
				get_tree().paused = true
				$deathscreeen.show()
				$deathscreeen/Sprite2D/AnimationPlayer.play("deathanimation")
		else:
			pass
	elif autoload.intials == true:
		pass


func _on_tptimer_timeout() -> void:
	self.global_position = Vector2(0,0)
	autoload.intials = false
