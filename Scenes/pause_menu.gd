extends Control

@export var library_button : Button
var library_asset_in_range : bool = false
var is_paused := false

func pause():
	is_paused = true
	visible = true
	if library_asset_in_range:
		library_button.visible = true
	else:
		library_button.visible = false

func unpause():
	is_paused = false
	visible = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if is_paused:
			unpause()
		else:
			pause()
	pass
