class_name Interactable
extends StaticBody3D

@export var prompt_message = "teste"
@export var prompt_action = "interact"

@onready var sprite = $Sprite3D
@onready var camera1 = $Control/Vp/Node3D/Camera1
@onready var camera2 = $Control/Vp/Node3D/Camera2


func mouseover():
	for action in InputMap.action_get_events(prompt_action):
		if action is InputEventKey:
			return prompt_message
		
func pressed():
	print("Apertou o botão" + prompt_message)
	camera2.make_current()
	
	
