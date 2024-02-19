extends AudioStreamPlayer3D

var rng = RandomNumberGenerator.new()
var rand = 0
var stop = false

func _ready():
	play()

func _process(delta):
	if $"../../Player".position.z <= -104:
		stop = true
		stream_paused = true
		$"../Sprite3D".scale.x = 0
		
	if not stop:
		await get_tree().create_timer(190).timeout
		play()
