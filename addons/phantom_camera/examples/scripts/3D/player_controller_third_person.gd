extends "player_controller.gd"

@export var _player_pcam_FIRSTPERSON: PhantomCamera3D
@export var _aim_pcam: PhantomCamera3D
@export var _player_pcam_CLOSE: PhantomCamera3D
@export var _player_pcam_NEUTRAL: PhantomCamera3D
@export var _player_pcam_FAR: PhantomCamera3D
@export var _player_pcam_VERYFAR: PhantomCamera3D
@export var _ceiling_pcam: PhantomCamera3D

@onready var pcams : Array[PhantomCamera3D] = [_player_pcam_FIRSTPERSON,_aim_pcam,_player_pcam_CLOSE,_player_pcam_NEUTRAL,_player_pcam_FAR,_player_pcam_VERYFAR,_ceiling_pcam]
@onready var _player_direction: Node3D = %PlayerDirection

@export var mouse_sensitivity: float = 0.05

@export var min_pitch: float = -89.9
@export var max_pitch: float = 50

@export var min_yaw: float = 0
@export var max_yaw: float = 360

enum {FIRST_PERSON, OVER_SHOULDER, CLOSE, NEUTRAL, FAR, VERY_FAR, TOP_DOWN}
var camera_distance := NEUTRAL

func _ready() -> void:
	super()
	
	if _player_pcam_NEUTRAL.get_follow_mode() == _player_pcam_NEUTRAL.FollowMode.THIRD_PERSON:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	current_pcam = pcams[4]
	current_pcam.set_priority(30)

@export var pause_menu : Control
func _physics_process(delta: float) -> void:
	if !pause_menu.is_paused:
		super(delta)

		if velocity.length() > 0.2:
			var look_direction: Vector2 = Vector2(velocity.z, velocity.x)
			_player_direction.rotation.y = look_direction.angle()
	else:
		velocity = Vector3.ZERO
		move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if !pause_menu.is_paused:
		for i in pcams:
				if is_instance_valid(i) and i.follow_mode == PhantomCamera3D.FollowMode.THIRD_PERSON:
					_set_pcam_rotation(i, event)
		if event.is_action_pressed("cam_any"):
			go_to_next_pcam()
		if event.is_action_pressed("cam_1_fps"):
			go_to_next_pcam(0)
		if event.is_action_pressed("cam_2_shoulder"):
			go_to_next_pcam(1)
		if event.is_action_pressed("cam_3_close"):
			go_to_next_pcam(2)
		if event.is_action_pressed("cam_4_neutral"):
			go_to_next_pcam(3)
		if event.is_action_pressed("cam_5_far"):
			go_to_next_pcam(4)
		if event.is_action_pressed("cam_6_veryfar"):
			go_to_next_pcam(5)
		if event.is_action_pressed("cam_7_topdown"):
			go_to_next_pcam(6)

var current_pcam : PhantomCamera3D
func go_to_next_pcam(new_pcam_index:int =(pcams.find(current_pcam) + 1)%7):
	if (new_pcam_index == 0):
		visible = false
	else:
		visible = true
	current_pcam.set_priority(1)
	current_pcam = pcams[new_pcam_index]
	current_pcam.set_priority(30)
	print("Toggled to "+str(new_pcam_index))

func _set_pcam_rotation(pcam: PhantomCamera3D, event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var pcam_rotation_degrees: Vector3

		# Assigns the current 3D rotation of the SpringArm3D node - so it starts off where it is in the editor
		pcam_rotation_degrees = pcam.get_third_person_rotation_degrees()

		# Change the X rotation
		pcam_rotation_degrees.x -= event.relative.y * mouse_sensitivity

		# Clamp the rotation in the X axis so it go over or under the target
		pcam_rotation_degrees.x = clampf(pcam_rotation_degrees.x, min_pitch, max_pitch)

		# Change the Y rotation value
		pcam_rotation_degrees.y -= event.relative.x * mouse_sensitivity

		# Sets the rotation to fully loop around its target, but witout going below or exceeding 0 and 360 degrees respectively
		pcam_rotation_degrees.y = wrapf(pcam_rotation_degrees.y, min_yaw, max_yaw)

		# Change the SpringArm3D node's rotation and rotate around its target
		pcam.set_third_person_rotation_degrees(pcam_rotation_degrees)


func _toggle_aim_pcam(event: InputEvent) -> void:
	if event is InputEventMouseButton \
		and event.is_pressed() \
		and event.button_index == 2 \
		and (_player_pcam_NEUTRAL.is_active() or _aim_pcam.is_active()):
		if _player_pcam_NEUTRAL.get_priority() > _aim_pcam.get_priority():
			_aim_pcam.set_priority(30)
		else:
			_aim_pcam.set_priority(0)
