extends Node2D

func _ready():
	await get_tree().create_timer(6).timeout
	get_tree().change_scene_to_file("res://main_menu.tscn")


