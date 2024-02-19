extends Node2D

func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
	
func _input(event):
	if event is InputEventKey:
		if event.pressed:
			get_tree().change_scene_to_file("res://world.tscn")
