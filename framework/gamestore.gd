extends ScrollContainer
var pressed = false
@export var function:Callable
@onready var object =preload("res://label.tscn")
var gamenameandlinks = [{"gamename":"Magicfight","Url":"https://lostlp09.itch.io/magic-parkour"},
	{"gamename":"gridbuilder","Url":"https://lostlp09.itch.io/gridbuilder"},
	{"gamename":"ballfall","Url":"https://lostlp09.itch.io/ball-fall"},
	{"gamename":"Signalrobotgame","Url":"https://lostlp09.itch.io/signal-roblot-game"},
	{"gamename":"flagguesser","Url":"https://lostlp09.itch.io/flagguesser"},
	{"gamename":"coinclickerx","Url":"https://lostlp09.itch.io/coinclickerx"}
	]
func _ready() -> void:

	function = generatebuttons
	pass
var gameurl
func generatebuttons()->void:
	var startpos = Vector2(-100,156)
	var anzahl = 1
	for i in gamenameandlinks:
		print("yo")
		
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


func _on_texture_button_pressed() -> void:
	if pressed == false:
		$".".visible = true
		function.call()
		pressed = true
	else:
		pressed = false
		$".".visible = false
		for i in $VBoxContainer/Panel.get_children():
			i.queue_free()
