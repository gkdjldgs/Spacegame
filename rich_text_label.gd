extends RichTextLabel
var texting = 'Score: '
func _process(delta: float) -> void:
	var text = str(texting, str(autoload.score))
	self.text = text
	if autoload.death == false:
		self.show()
	elif autoload.death == true:
		self.hide()
		
