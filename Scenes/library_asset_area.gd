extends Area3D
class_name LibraryAssetArea
@export var library_asset : String = "library_asset"
@export var associated_camera : PhantomCamera3D
@export var text_label : Label3D

func _ready() -> void:
	#connect("area_entered", _entered_area)
	#connect("area_exited", _exited_area)
	input_event.connect(_on_input_event)
	text_label.text = name

func _on_input_event(camera:Node,event:InputEvent,event_position:Vector3,normal:Vector3,shape_index:int):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			MainSingleton.pause_menu.set_current_library_asset(self)
	pass

#func _entered_area(area):
	#if area is PlayerArea:
		#if get_tree().get_first_node_in_group("PauseMenu") != null:
			#get_tree().get_first_node_in_group("PauseMenu").current_library_asset = self
#func _exited_area(area):
	#if area is PlayerArea:
		#if get_tree().get_first_node_in_group("PauseMenu") != null:
			#if get_tree().get_first_node_in_group("PauseMenu").current_library_asset == self:
				#get_tree().get_first_node_in_group("PauseMenu").current_library_asset = null
