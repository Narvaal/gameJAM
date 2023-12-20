class_name Action
extends StaticBody3D

@onready var player = get_node("/root/AlanScenen/Player")

@export_category("Promp config")
@export var prompt_message = "[E] to sit"
@export var prompt_action = "interact"

@export_category("Siting position")
@export var pos = Vector3(0,0,0)
@export var rot = Vector3(0,0,0)

var pos_player_before = Vector3(0,0,0)
var rot_player_before = Vector3(0,0,0)

func _ready():
	pos += global_position
	
func mouseover():
	for action in InputMap.action_get_events(prompt_action):
		if action is InputEventKey:
			return prompt_message
		
func pressed():
	if	player.can_move:
		pos_player_before = player.global_position
		player.can_move = false
		player.global_position = pos
		player.global_rotation = rot
		#player.sitting = true
	else:
		player.can_move = true
		player.global_position = pos_player_before
		player.global_rotation = rot_player_before
		#player.sitting = false
