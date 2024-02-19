extends DirectionalLight3D

var brightness = 2.3
var x = false

func _process(delta):
	if $"../../Player".position.z <= -104:
		light_energy = brightness
		$"../DirectionalLight3D2".light_energy = brightness
		$"../../NavigationRegion3D/CSGCombiner3D2/SpecialBox".position.x = -59.167
		if !x:
			$"../../Music".play()
			x = true
		
		if $"../../BigMoai".position.y <= 20:
			$"../../BigMoai".position.y += 0.3
		
