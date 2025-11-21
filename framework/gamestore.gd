extends ScrollContainer

@onready var object =preload("res://label.tscn")
var gamenameandlinks = [{"gamename":"Magicfight","Url":"https://lostlp09.itch.io/magic-parkour"},
	{"gamename":"gridbuilder","Url":"https://lostlp09.itch.io/gridbuilder"},
	{"gamename":"ballfall","Url":"https://lostlp09.itch.io/ball-fall"},
	{"gamename":"Signalrobotgame","Url":"https://lostlp09.itch.io/signal-roblot-game"},
	{"gamename":"flagguesser","Url":"https://lostlp09.itch.io/flagguesser"},
	{"gamename":"coinclickerx","Url":"https://lostlp09.itch.io/coinclickerx"}
	]
func _ready() -> void:
	generatebuttons()
	pass # Replace with function body.
var gameurl
func generatebuttons()->void:
	var startpos = Vector2(-100,156)
	var anzahl = 1
	for i in gamenameandlinks:
		
		var clone:Label= object.instantiate()
		if anzahl == 5:
			anzahl = 1
			startpos.y += 400
		clone.visible = true
		clone.position = Vector2(startpos.x +(anzahl *300),startpos.y)
		$VBoxContainer/Panel.add_child(clone)
		anzahl +=1
		print(clone.position)
		clone.get_node("Button").pressed.connect(onplaypressed.bind(i["Url"]))
		clone.text = "            " + i["gamename"]
func onplaypressed(gameurl)->void:
	OS.shell_open(gameurl)
