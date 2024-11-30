extends VBoxContainer

func quit_game() -> void:
	get_tree().quit()

func load_main_scene():
	get_tree().change_scene_to_file("res://main_scene.tscn")
