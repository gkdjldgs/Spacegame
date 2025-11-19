extends Control

var menuoriginalpos := Vector2(0,0)
var menuoriginalscale := Vector2(0,0)

var current_menu
var menu_stack := []

@onready var menu1 = $Menu1
@onready var menu2 = $Menu2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menuoriginalpos = Vector2(0,0)
	menuoriginalscale = get_viewport_rect().size
	current_menu = menu1
	
func movetonewmenu(nextid: String):
	var nextmenu = getidfrommenu(nextid)
	var tween = create_tween()
	tween.parallel().tween_property(nextmenu, 'global_position', menuoriginalpos, 5)
	
	tween.parallel().tweem_property(current_menu, 'global_position')
	
func movetooldmenu():
	pass
	
func getidfrommenu(menuid: String) -> Control:
	match menuid:
		'menu1':
			return menu1
		'menu2':
			return menu2
		_:
			return menu1
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
