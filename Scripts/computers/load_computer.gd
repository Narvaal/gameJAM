class_name change_scene
extends StaticBody3D

@export_category("Promp config")
@export var prompt_message = "[E] to sit"
@export var prompt_action = "interact"
var parent = MeshInstance3D

func mouseover():
	for action in InputMap.action_get_events(prompt_action):
		if action is InputEventKey:
			return prompt_message
		
func pressed():
	get_tree().change_scene_to_file("res://scenes/control.tscn")
	#create_trashball()
