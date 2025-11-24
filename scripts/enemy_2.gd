extends CharacterBody2D

const speed = 25
@onready var health = $health.health
@onready var navigationagent : NavigationAgent2D = $NavigationAgent2D
@export var chase: CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_physics_process(false)
	call_deferred('wait')
func wait():
	await get_tree().physics_frame
	set_physics_process(true)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	navigationagent.target_position = autoload.player_position
	velocity = global_position.direction_to(navigationagent.get_next_path_position()) * speed
	move_and_slide()

func handle_hit():
	health = 0
	if health == 0:
		autoload.score += 50
		var number = randi_range(1,10)
		print(number)
		var deathcation = self.global_position
		if number == 1:
				var item = preload('res://bulletupgrade.tscn')
				var items = item.instantiate()
				add_child(items)
				items.global_position = deathcation
				print(deathcation)
				self.queue_free()
		elif number == 2:
				var item = preload('res://heart heal.tscn')
				var items = item.instantiate()
				add_child(items)
				items.global_position = deathcation
				self.queue_free()
		else:
			self.queue_free()
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method('player_hit'):
		body.player_hit()
		self.queue_free()
	else:
		pass
