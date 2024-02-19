extends CharacterBody3D

@export var speed = 10.0
@export var accel = 10.0
@export var sensitivity = 0.2
@export var min_angle = -80
@export var max_angle = 90	

@onready var head = $Head

var input_dir

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var look_rot : Vector2
var stand_height : float

var moais = 0

func _ready():
	#stand_height = collision_shape.shape.height
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		look_rot.y -= (event.relative.x * sensitivity)
		look_rot.x -= (event.relative.y * sensitivity)
		look_rot.x = clamp(look_rot.x, min_angle, max_angle)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	input_dir = Input.get_vector("left", "right", "forward", "backward")


	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = lerp(velocity.x, direction.x * speed, accel * delta)
		velocity.z = lerp(velocity.z, direction.z * speed, accel * delta)
	else:
		velocity.x = lerp(velocity.x, 0.0, accel * delta)
		velocity.z = lerp(velocity.z, 0.0, accel * delta)

	move_and_slide()
	
	head.rotation_degrees.x = look_rot.x
	rotation_degrees.y = look_rot.y
	
	if moais >= 5:
		$"../StaticBody3D".position.y = -100
	
	if position.x > 30:
		if position.z >= -104:
			$"../CanvasLayer/Label".text = str(moais) + "/5"
		else:
			$"../CanvasLayer/Label".text = "∞/5"
		
	if position.z <= -259:
		get_tree().quit()
		
	if position.y <= -12:
		get_tree().change_scene_to_file("res://jumpscare2.tscn")
		
	if position.z > -38:
		if position.x < -109:
			$"../CanvasLayer/Label".text = "As you wish."
		elif position.x < -89:
			$"../CanvasLayer/Label".text = "You will regret this."
		elif position.x < -59:
			$"../CanvasLayer/Label".text = "Turn back."
		elif position.x < -30:
			$"../CanvasLayer/Label".text = "Stop."
	else:
		$"../CanvasLayer/Label".text = str(moais) + "/5"
