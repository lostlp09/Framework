extends Label


# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var time = Time.get_datetime_dict_from_system()
	self.text =str(time ["hour"]) +":"+ str(time["minute"]) + "    "+str(time["day"]) + ":" + str(time["month"])+ "   " + str(time["year"])
	
