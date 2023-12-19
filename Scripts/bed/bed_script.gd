class_name Action2
extends StaticBody3D

@onready var player = get_node("/root/AlanScenen/Player")
@onready var sleep_cam = $sleep_view
@onready var hidde_cam = $hidde_view
var standing = true

@export_category("Promp config")
@export var prompt_message = "[E] to sit"
@export var prompt_action = "interact"
@export var prompt_action2 = "interact2"


func _ready():
	pass
	
func mouseover():
	for action in InputMap.action_get_events(prompt_action):
		if action is InputEventKey:
			return prompt_message


func pressed2():
	if standing:
		standing = false
		hidde_cam.set_current(true)
		player.visible = false
		player.can_move = false
		player.can_look_around = false
	else:
		standing = true
		player.set_player_cam()
		player.visible = true	
		player.can_move = true
		player.can_look_around = true

func pressed():
	if standing:
		standing = false
		sleep_cam.set_current(true)
		player.visible = false
		player.can_move = false
		player.can_look_around = false
	else:
		standing = true
		player.set_player_cam()
		player.visible = true	
		player.can_move = true
		player.can_look_around = true
