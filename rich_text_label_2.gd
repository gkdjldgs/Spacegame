extends RichTextLabel


var texting = "Score: "
func _process(delta: float) -> void:
		var text = str(texting, str(autoload.score))
		self.text = (text)
