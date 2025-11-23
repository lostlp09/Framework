extends Node2D

func _ready() -> void:
	self.get_node("Button").mouse_entered.connect(mouseenter)
	self.get_node("Button").mouse_exited.connect(mouseexit)
# Called when the node enters the scene tree for the first time.
var mouseentered = false
func _process(delta: float) -> void:

	if Input.is_action_pressed("mausgedrückt") and mouseentered == true :
		self.position =  get_global_mouse_position() 




func mouseenter() -> void:
	mouseentered = true


func mouseexit() -> void:
	mouseentered = false
