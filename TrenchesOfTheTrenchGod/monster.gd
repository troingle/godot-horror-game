extends CharacterBody3D

const SPEED = 7.0
const ACCEL = 10
const RANGE = 3.0

@onready var nav = $NavigationAgent3D

func _physics_process(delta):
	await get_tree().create_timer(1).timeout

	var direction = Vector3()
	
	nav.target_position = $"../Player".global_position
	
	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * SPEED, ACCEL * delta)
	
	move_and_slide()
	
	var dist = global_position.distance_to($"../Player".global_position)
	if dist < RANGE and !$"../WorldEnvironment/DirectionalLight3D".x:
		get_tree().change_scene_to_file("res://jumpscare.tscn")
