extends RichTextLabel

func _ready() -> void:
	self.hide()
	
func _process(delta: float) -> void:
	var text = str(autoload.score)
	self.text = text


func _on_timer_timeout() -> void:
	self.show()
