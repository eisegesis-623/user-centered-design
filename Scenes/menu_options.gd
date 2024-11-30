extends VBoxContainer

func quit_game() -> void:
	get_tree().quit()

func load_main_scene():
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")

func load_library():
	get_tree().change_scene_to_file("res://Scenes/demo_library.tscn")
