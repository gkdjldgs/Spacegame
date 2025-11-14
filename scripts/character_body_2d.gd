extends CharacterBody2D
@export var bullet = preload('res://bullet.tscn')
@onready var gunend = $Marker2D
@onready var gundirection = $Marker2D2
signal bulletfired(bullet,position,direction)
var speed = 30
var health = 3
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
	var direction = (gundirection.global_position - gunend.global_position).normalized()
	emit_signal("bulletfired",bullet_instance,gunend.global_position,direction)

func handle_hit():
	print("OW")
