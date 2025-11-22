extends  TextureButton
var pressed1 = false
func _pressed() -> void:
	if pressed1 == false:
		self.get_parent().get_parent().get_node("bunny").visible = true
		pressed1 = true
	else:
		pressed1 = false
		self.get_parent().get_parent().get_node("bunny").visible = false
