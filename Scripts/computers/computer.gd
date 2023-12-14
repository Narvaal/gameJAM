class_name Interactable
extends StaticBody3D

@export_category("Promp config")
@export var prompt_message = "[E] to change cams"
@export var prompt_action = "interact"


@onready var cams = $Control/ViewPort/Node3D.get_children()

var _currentCamera: int = 0

func mouseover():
	for action in InputMap.action_get_events(prompt_action):
		if action is InputEventKey:
			return prompt_message
		
func pressed():
	_currentCamera += 1
	if _currentCamera == cams.size():
		_currentCamera = 0
	cams[_currentCamera].make_current()
