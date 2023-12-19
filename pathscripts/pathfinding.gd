extends CharacterBody3D


var speed = 10
var accel = 10

@onready var nav: NavigationAgent3D = $NavigationAgent3D
@onready var goal = $"../Marker3D"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	var direction = Vector3()
	
	nav.target_position = goal.global_position
	
	
	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * speed, accel * delta)

	move_and_slide()
