extends Control

@export var library_button : Button
var current_library_asset : LibraryAssetArea = null
var is_paused := false

func _ready() -> void:
	current_library_asset = null

func pause():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	is_paused = true
	visible = true
	if current_library_asset != null:
		library_button.visible = true
		current_library_asset.text_label.visible = true
		if current_library_asset.associated_camera != null:
			current_library_asset.associated_camera.set_priority(100)
	else:
		library_button.visible = false

func unpause():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	is_paused = false
	if current_library_asset != null:
		current_library_asset.text_label.visible = false
		if current_library_asset.associated_camera != null:
			current_library_asset.associated_camera.set_priority(0)
	visible = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if is_paused:
			unpause()
		else:
			pause()
	pass

func return_to_main_menu():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func go_to_library():
	get_tree().change_scene_to_file("res://Scenes/demo_library.tscn")
