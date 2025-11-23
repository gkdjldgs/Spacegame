extends RichTextLabel

var texting = 'Wave: '
func _process(delta: float) -> void:
	var text = str(texting, str(autoload.wave))
	self.text = text
	if autoload.death == false:
		self.show()
	elif autoload.death == true:
		self.hide()
