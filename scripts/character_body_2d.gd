extends CharacterBody2D
@export var bullet = preload('res://bullet.tscn')
@onready var gunend = $Marker2D
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
	add_child(bullet_instance)
	bullet_instance.global_position = gunend.global_position
	var target = get_global_mouse_position()
	var mirection = bullet_instance.global_position.direction_to(target).normalized()
	bullet_instance.set_direction(mirection)
