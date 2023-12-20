class_name change_scene
extends StaticBody3D

@onready var player = get_node("/root/AlanScenen/Player")
@onready var line = get_node("/root/AlanScenen/Control/SubViewportContainer/SubViewport/MarginContainer/PanelContainer/VSplitContainer/ColorRect2/LineEdit")
@onready var control = get_node("/root/AlanScenen/Control")
@export_category("Promp config")
@export var prompt_message = ""
@export var prompt_action = "interact"
var parent = MeshInstance3D

func mouseover():
	for action in InputMap.action_get_events(prompt_action):
		if action is InputEventKey:
			return prompt_message
		
func pressed():
	line.clear()
	#player.toggle_mouse()
	self.collision_layer = player.collision_layer + 1
	player.can_move = false
	player.can_look_around = false
	control.visible = true

