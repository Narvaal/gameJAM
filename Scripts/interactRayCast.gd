extends RayCast3D

@onready var prompt = $Prompt
@onready var note = $note

@onready var control = get_node("/root/AlanScenen/Control")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	prompt.text = ""
	
	if note.visible:
		if Input.is_action_just_pressed("interact"):
			note.visible = false
	
	#Pega o coliding
	#Esse codigo tá uma P$%ra
	if is_colliding():
		var detected = get_collider()
		if detected is Interactable or detected is Action or detected is Notes or detected is Action2 or detected is change_scene:
			prompt.text = detected.mouseover()
			
			
				
			if detected is change_scene and control.visible == false:
				if Input.is_action_just_pressed(detected.prompt_action):
					detected.pressed()
			else:
				if Input.is_action_just_pressed(detected.prompt_action):
					detected.pressed()


			if detected is Interactable or detected is Action2:
				if Input.is_action_just_pressed(detected.prompt_action2):
					detected.pressed2()
