extends ScrollContainer

@onready var object =$VBoxContainer/Panel/Sprite2D
var links = 0
func _ready() -> void:
	generatebuttons()
	pass # Replace with function body.
var gameurl
func generatebuttons()->void:
	var index = 0
	var startpos = Vector2(0,156)
	var anzahl = 1
	for i in range(0,10):
		index += 1
		var clone:Sprite2D= object.duplicate()
		if anzahl == 5:
			anzahl = 1
			startpos.y += 400
		clone.visible = true
		clone.position = Vector2(startpos.x +(anzahl *300),startpos.y)
		$VBoxContainer/Panel.add_child(clone)
		anzahl +=1
		print(clone.position)

func onplaypressed()->void:
