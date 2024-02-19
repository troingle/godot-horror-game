extends Node3D

var pickupRange = 3

func _process(delta):
	var dist = global_position.distance_to($"../../Player".global_position)
	if dist < pickupRange:
		$"../../Player".moais += 1
		self.queue_free()
