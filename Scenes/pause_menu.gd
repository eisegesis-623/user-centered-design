extends Control
class_name PauseMenu

@export var library_button : Button
var current_library_asset : LibraryAssetArea = null
var is_paused := false

func _ready() -> void:
	MainSingleton.pause_menu = self
	current_library_asset = null

func pause():
	current_library_asset = null
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	is_paused = true
	visible = true

func unpause():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	is_paused = false
	revert_current()
	visible = false

func set_current_library_asset(_cla):
	revert_current()
	current_library_asset = _cla

func revert_current():
	if current_library_asset != null:
		current_library_asset.text_label.visible = false
		if current_library_asset.associated_camera != null:
			current_library_asset.associated_camera.set_priority(0)
		
func _process(delta: float) -> void:
	if is_paused:
		validate_current_library_asset()

func validate_current_library_asset():
	if current_library_asset != null:
		library_button.visible = true
		deselect_button.visible = true
		current_library_asset.text_label.visible = true
		if current_library_asset.associated_camera != null:
			current_library_asset.associated_camera.set_priority(100)
	else:
		library_button.visible = false
		deselect_button.visible = false
@onready var deselect_button: Button = $VBoxContainer/DeselectButton

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


func deselect_item() -> void:
	revert_current()
	current_library_asset = null
