class_name Notes 
extends StaticBody3D

@onready var player = get_node("/root/AlanScenen/Player")
@onready var note = get_node("/root/AlanScenen/Player/Head/Vertical/InteractRayCast/note")
@onready var sprite = get_node("/root/AlanScenen/Player/Head/Vertical/InteractRayCast/note/StaticBody3D/CollisionShape3D/Sprite3D")

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
	sprite.texture = $CollisionShape3D/Sprite3D.texture
