extends Label

var timeuntilitsover = 22
var goal =  1765839600

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var current  = Time.get_unix_time_from_system()
	var end= int(goal - current)
	var days = int(end/86400)
	var hour = int(end % 86400/3600)
	var min= int((end %3600)/60)
	var seconds = int((end %60))
	self.text = "Time remaing until Siege is over:\n" +"" + str(days) +":"+str(hour)+":"+ str(min)+  ":" +str(seconds)
