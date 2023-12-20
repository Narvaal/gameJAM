extends CharacterBody3D

@export_category("Settings Player")
@export var speed = 5.0
@export var jump_force = 4.5
@export var can_move = true
@export var can_look_around = true
var mouse_cap = false
var sitting = false
@export_category("Camera Settings")
@export var mouse_sensitivity := 0.2
@export var camera_limit_down := -80.0
@export var camera_limit_up := 60.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var cam_vertical := 0.0
@onready var camera = get_node("Head/Vertical/Camera3D")

# Pega o input do mouse, caso o input seja uma alteração no eixo X, roda o eixo y do personagem
func _input(event: InputEvent):
	if event is InputEventMouseMotion and can_look_around:
		# roda em y
		rotate_y(deg_to_rad(-event.relative.x * mouse_sensitivity))
		# roda em X
		cam_vertical -= event.relative.y * mouse_sensitivity
		cam_vertical = clamp(cam_vertical,camera_limit_down,camera_limit_up)
		$Head/Vertical.rotation_degrees.x = cam_vertical
		
	# Esc solta o mouse
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	# Click segura o mouse
	if Input.is_action_just_pressed("click"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	
# quando o jogo começar, trava o mouse na tela
func _ready():
	mouse_cap = true
	set_player_cam()
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func set_player_cam():
	camera.set_current(true)


func toggle_mouse():
	if mouse_cap == false:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		mouse_cap = true
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		mouse_cap = false


func _physics_process(delta):
	# Add the gravity.
	if can_move:
		
		if not is_on_floor():
			velocity.y -= gravity * delta

		# Handle Jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = jump_force

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
			velocity.z = move_toward(velocity.z, 0, speed)

		move_and_slide()
