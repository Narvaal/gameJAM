class_name Interactable
extends StaticBody3D

@export var prompt_message = "teste"
@export var prompt_action = "interact"


func mouseover():
	for action in InputMap.action_get_events(prompt_action):
		if action is InputEventKey:
			return prompt_message
		
func pressed():
	print("Apertou o botão" + prompt_message)
