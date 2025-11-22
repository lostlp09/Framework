extends ScrollContainer
var pressed = false
@export var function:Callable
@onready var object =preload("res://youtubefakevideos.tscn")
var gamenameandlinks = [{"gamename":"
Is the Framework 13 (2025) Worth the $$$? Dev’s Perspective
","Url":"https://youtu.be/ZxuzmF8nfSU?si=aDic2uLFq5R9nILe","image":preload("res://youtubethumbnails/frameworkvideo1.png")},
	{"gamename":"
TOP 50 YOUTUBE BACKGROUND SONGS 😱😱😱
","Url":"https://www.youtube.com/watch?v=Ha3PktcY5yA&autoplay=1","image":preload("res://youtubethumbnails/topyoutubesong.png")},
{"gamename":"
Get free Robux now!!!!!
","Url":"https://youtu.be/xvFZjo5PgG0?si=otKSlGA8JfD9f3kl","image":preload("res://youtubethumbnails/freebobux.png")},
{"gamename":"
Hytale Gameplay omg !!!
","Url":"https://youtu.be/rhaqjb_S2X8?si=BesysO_eUDvZ-k_R","image":preload("res://youtubethumbnails/hytale.png")},
{"gamename":"
Ein Stern
","Url":"https://www.youtube.com/watch?v=2Ua9af7xC9c","image":preload("res://youtubethumbnails/Ein Stern.png")},
{"gamename":"
This is Why I Bought use Framework Laptop
","Url":"https://www.youtube.com/watch?v=mAYKlKyv6tI&t=485s","image":preload("res://youtubethumbnails/Screenshot 2025-11-22 182933.png")},
  	]
func _ready() -> void:
	generatebuttons()

	function = generatebuttons
var gameurl
func generatebuttons()->void:
	var startpos = Vector2(-96.0,200)
	var anzahl = 1
	for i in gamenameandlinks:
		print("yo")
		
		var clone:Sprite2D= object.instantiate()
		if anzahl == 4:
			anzahl = 1
			startpos.y += 400
		clone.visible = true
		clone.position = Vector2(startpos.x +(anzahl *432),startpos.y)
		$VBoxContainer/Panel.add_child(clone)
		anzahl +=1
		print(clone.position)
		clone.texture = i["image"]
		clone.get_node("Button").pressed.connect(onplaypressed.bind(i["Url"]))
		clone.get_node("Label").text = i["gamename"]
		
func onplaypressed(gameurl)->void:
	OS.shell_open(gameurl)


func _on_texture_button_pressed() -> void:
	if pressed == false:
		$".".get_parent().visible = true
		function.call()
		pressed = true
	else:
		pressed = false
		$".".get_parent().visible = false
		for i in $VBoxContainer/Panel.get_children():
			i.queue_free()
