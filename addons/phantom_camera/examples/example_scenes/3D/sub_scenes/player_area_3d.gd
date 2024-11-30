extends Area3D
class_name PlayerArea
func _ready() -> void:
	connect("area_entered", _entered_area)
	connect("area_exited", _exited_area)

func _entered_area(area):
	pass
func _exited_area(area):
	pass
