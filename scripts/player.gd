extends CharacterBody2D
@export var bullet = preload('res://bullet.tscn')
@onready var gunend = $Marker2D
signal bulletfired(bullet,position,direction)
var speed = 30
func _process(delta: float) -> void:
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
		shoot()
		
func shoot():
	var bullet_instance = bullet.instantiate()
	var target = get_global_mouse_position()
	var mirection = gunend.global_position.direction_to(target).normalized()
	emit_signal("bulletfired",bullet_instance,mirection.position,mirection)
