extends Area3D

@export var library_asset : String = "library_asset"
@export var associated_camera : PhantomCamera3D
@export var text_label : Label3D

func _ready() -> void:
	connect("area_entered", _entered_area)
	connect("area_exited", _exited_area)

func _entered_area(area):
	pass
func _exited_area(area):
	pass
