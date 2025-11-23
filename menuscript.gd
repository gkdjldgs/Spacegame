extends Node2D
var menu = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	if menu == 1:
		$Sprite2D.hide()
		$Sprite2D2.show()
		menu = 2
	elif menu == 2:
		$Sprite2D2.hide()
		$Sprite2D.show()
		menu = 1
