extends CanvasLayer
var check = 3

func _process(delta: float) -> void:
	pass
func heartcheck():
	var health = autoload.playerhealth
	if health != 3:
		if health == 2:
			$Heart3.hide()
			$Heartanimation3/AnimationPlayer.play('heartdisappear')
			check = 2
		elif health == 1:
			$Heart2.hide()
			$Heartanimation2/AnimationPlayer.play('heartdisappear')
			check = 1
		elif health == 0:
			$Heart1.hide()
			$Heartanimation1/AnimationPlayer.play('heartdisappear')
	else:
		pass
		
func heal():
	if autoload.health < 3:
		if autoload.playerhealth > check:
			if check == 2:
				$Heartanimation3/AnimationPlayer.play('heartappear')
				$Heart3.show()
				check = 3
			elif check == 1:
				$Heartanimation2/AnimationPlayer.play('heartappear')
				$Heart2.show()
				check = 2
			else:
				pass
		else:
			pass
	else:
		pass
