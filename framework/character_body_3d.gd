extends CharacterBody3D
var xrotation 
@onready var camera = $Camera3D
@onready var leptop = $"../Sketchfab_Scene"
@onready var interact = $"../Control/Label"
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	xrotation = camera.rotation_degrees.x
func _input(event: InputEvent) -> void:


	if event is InputEventMouseMotion:
		xrotation -= event.relative.y  * 0.1
		xrotation = clamp(xrotation,-83.3,37.9)
		
		camera.rotation_degrees.x = xrotation
		self.rotation.y -= event.relative.x * 0.001

func _physics_process(delta: float) -> void:
	var distance = self.position.distance_to(leptop.position)
	if  distance <= 3:
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file("res://2d.tscn")
			Input.mouse_mode = Input.MOUSE_MODE_CONFINED
		interact.visible = true
	else:
		interact.visible = false
	var movment = Vector3.ZERO

	var leftright = Input.get_axis("left","right")
	var forbackwards = Input.get_axis("forward","backwardss")
	
	movment.y = -30
	movment.x = leftright *-600 * delta
	movment.z = forbackwards *-600 * delta
	movment = movment.rotated(Vector3.UP,self.rotation.y)
	print(movment)
	self.velocity = movment
	move_and_slide()
