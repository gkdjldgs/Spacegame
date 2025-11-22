extends CanvasLayer
var check = 5

func _process(delta: float) -> void:
	pass
func heartcheck():
	var health = autoload.playerhealth
	if health != check:
		if health == 2:
			$Heart3.hide()
			$Heartanimation3/AnimationPlayer.play('heartdisappear')
		elif health == 1:
			$Heart2.hide()
			$Heartanimation2/AnimationPlayer.play('heartdisappear')
		elif health == 0:
			$Heart1.hide()
			$Heartanimation1/AnimationPlayer.play('heartdisappear')
	else:
		pass
		
