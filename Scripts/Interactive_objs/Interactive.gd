class_name Action
extends StaticBody3D

@onready var player = get_node("/root/world/Player")

@export_category("Promp config")
@export var prompt_message = "[E] to sit"
@export var prompt_action = "interact"

func mouseover():
	for action in InputMap.action_get_events(prompt_action):
		if action is InputEventKey:
			return prompt_message
		
func pressed():
	if	player.can_move:
		player.can_move = false
	else:
		player.can_move = true
