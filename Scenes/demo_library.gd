extends Control


func return_to_game():
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")

func mainMenu():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
