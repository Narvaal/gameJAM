class_name Notes 
extends StaticBody3D

@onready var player = get_node("/root/AlanScenen/Player")
@onready var note = get_node("/root/AlanScenen/Player/Head/Vertical/InteractRayCast/note")


@export_category("Promp config")
@export var prompt_message = "[E] to sit"
@export var prompt_action = "interact"
var parent = MeshInstance3D


func _ready():
	parent = self.get_parent()

func mouseover():
	
	for action in InputMap.action_get_events(prompt_action):
		if action is InputEventKey:
			return prompt_message
		
func pressed():
	parent.queue_free()
	note.visible = true
	note.set_surface_override_material(0,parent.get_active_material(0))
	create_trashball()
	
func create_trashball():
		# STEP 1: add a cube to the scene
			# Step 1.1, create a Physics body.
			# I'm using a static body but this can be any
			# other type of Physics Body
		var cube = StaticBody3D.new()
		cube.transform.origin = player.position  # change initial pos here

		# STEP 3: attach script
			# It is actually required to have the script
			# attached before a node is defined as a child node
			# to the parent. So your step 3 goes here
		#cube.set_script(my_script)

		self.add_child(cube)  # Add as a child node to self
			# Step 1.2, add a collision shape to the
			# Physics body, defining its shape to a Box (cube)
		var coll = CollisionShape3D.new()
		coll.shape = BoxShape3D.new()
		cube.add_child(coll)  # Add as a child node to cube
			# Step 1.3, add a mesh, so that it's visible
		var mesh = MeshInstance3D.new()
		mesh.mesh = BoxShape3D.new()
		cube.add_child(mesh)  # Add as a child to cube

	# STEP 2: change texture
		# Step 2.1, load your texture from pc
	#var new_texture = ImageTexture.new()
	#new_texture.load("res://path/to/new_texture.png")
		# Step 2.2, get material from cube
	#var cube_material = mesh.get_surface_material(0)
		# Step 2.3, change texture from material to your new texture
	#cube_material.albedo_texture = new_texture
