extends Control


func return_to_game():
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")

func mainMenu():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


const SCREENSHOT_1 = preload("res://Screenshots/Screenshot 2024-12-03 234105.png")
const SCREENSHOT_2 = preload("res://Screenshots/Screenshot 2024-12-03 234116.png")
const SCREENSHOT_3 = preload("res://Screenshots/Screenshot 2024-12-03 234123.png")
const SCREENSHOT_4 = preload("res://Screenshots/Screenshot 2024-12-03 234129.png")
const SCREENSHOT_5 = preload("res://Screenshots/Screenshot 2024-12-03 234135.png")
const SCREENSHOT_6 = preload("res://Screenshots/Screenshot 2024-12-03 234144.png")
const SCREENSHOT_7 = preload("res://Screenshots/Screenshot 2024-12-03 234151.png")
const SCREENSHOT_8 = preload("res://Screenshots/Screenshot 2024-12-03 234200.png")
const SCREENSHOT_9 = preload("res://Screenshots/Screenshot 2024-12-03 234208.png")
const SCREENSHOT_10 = preload("res://Screenshots/Screenshot 2024-12-03 234214.png")

@onready var texture_rect: TextureRect = $TextureRect
@onready var rich_text_label: RichTextLabel = $RichTextLabel

@export var buttons : Array[Button]

func _ready() -> void:
	var loop = 1
	for i in buttons:
		i.focus_entered.connect(button_highlighted.bind(loop))
		i.mouse_entered.connect(on_mouse_entered.bind(i))
		loop+=1
func on_mouse_entered(button:Button):
	button.grab_focus()
	pass
func button_highlighted(index:int):
	match index:
		1:
			texture_rect.texture = SCREENSHOT_1
			rich_text_label.text = string1
		2:
			texture_rect.texture = SCREENSHOT_2
			rich_text_label.text = string2
		3:
			texture_rect.texture = SCREENSHOT_3
			rich_text_label.text = string3
		4:
			texture_rect.texture = SCREENSHOT_4
			rich_text_label.text = string4
		5:
			texture_rect.texture = SCREENSHOT_5
			rich_text_label.text = string5
		6:
			texture_rect.texture = SCREENSHOT_6
			rich_text_label.text = string6
		7:
			texture_rect.texture = SCREENSHOT_7
			rich_text_label.text = string7
		8:
			texture_rect.texture = SCREENSHOT_8
			rich_text_label.text = string8
		9:
			texture_rect.texture = SCREENSHOT_9
			rich_text_label.text = string9
		10:
			texture_rect.texture = SCREENSHOT_10
			rich_text_label.text = string10
	pass


var string1 = "This is an example description for this library asset.

This particular asset is a cube. You apparently thought it was interesting enough to click on.

Pretend you've learnt something useful about level design."

var string2 = "This is an example description for this library asset.

This particular asset is a pair of monkey heads. They are default meshes in Blender.

Pretend you've learnt something useful about level design."

var string3 = "This is an example description for this library asset.

This particular asset is a wall. Walls are forms that block all visibility behind them, revealing information only when passed.

Pretend you've learnt something spectacular about level design."

var string4 = "This is an example description for this library asset.

This is another wall.

Pretend you've learnt something useful about level design."

var string5 = "This is an example description for this library asset.

This is, in fact, yet another wall. Stunning!

Pretend you've learnt something useful about level design."

var string6 = "This is an example description for this library asset.

This particular asset is a triangle. These gradually reveal information behind them and can have many affordances depending on player mechanics.

Hopefully you've learnt something useful about level design."

var string7 = "This is an example description for this library asset.

Another triangle...

Pretend you've learnt something useful about level design."

var string8 = "This is an example description for this library asset.

Yet another triangle.

Pretend you've learnt something useful about level design."

var string9 = "This is an example description for this library asset.

Big triangle.

Pretend you've learnt something useful about level design."

var string10 = "This is an example description for this library asset.

Secret big triangle.

Pretend you've learnt something useful about level design."
