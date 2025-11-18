extends Node

func handle_bullet_spawned(bullet,position,direction,group):
	add_child(bullet)
	bullet.global_position = position
	bullet.set_direction(direction)
	if group == true:
		bullet.add_to_group('enemy')
	elif group == false:
		bullet.add_to_group('play')
