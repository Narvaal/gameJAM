extends RayCast3D

@onready var prompt = $Prompt

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	prompt.text = ""
	if is_colliding():
		var detected = get_collider()
		
		if detected is Interactable or detected is Action:
			prompt.text = detected.mouseover()
		
			if Input.is_action_just_pressed(detected.prompt_action):
				detected.pressed()
