class_name Interactable
extends StaticBody3D

@export_category("Promp config")
@export var prompt_message = "to change cams"
@export var prompt_action = "interact"
@export var prompt_action2 = "interact2"

@export_category("Screen config")
@export var selected_screen: SubViewport 

var cams: Array[Node]
var label_current_cam: Label
var current_cam: int = 0

@onready var audio_player = get_node("/root/AlanScenen/Room/computer/AudioStreamPlayer3D")
@onready var player = get_node("/root/AlanScenen/Player")
@onready var player_selected_screen = get_node("/root/AlanScenen/Player/screen_player")
@onready var player_screen = get_node("/root/AlanScenen/Player/screen_player/screen_colision/screen_image")
@onready var player_screen_colision = get_node("/root/AlanScenen/Player/screen_player")

func _ready():
	cams = selected_screen.get_child(1).get_children()
	label_current_cam = selected_screen.get_child(0)
	label_current_cam.text = str(current_cam + 1) + "/" + str(cams.size())

func mouseover():	
	for action in InputMap.action_get_events(prompt_action):
		if action is InputEventKey:
			return prompt_message 
	
	
func pressed():
	
	if current_cam < cams.size() - 1:
		current_cam += 1
	else:
		current_cam = 0
		
	label_current_cam.text = str(current_cam + 1) + "/" + str(cams.size())
	
	cams[current_cam].make_current()
	audio_player.play()
	
	
	
func pressed2():
	if player_screen.visible:
		#player.can_move = true
		#player.can_look_around = true
		player_screen_colision.collision_layer = player.collision_layer + 1
		player_screen.visible = false
	else:
		#player.can_move = false
		#player.can_look_around = false
		player_selected_screen.selected_screen = self.selected_screen
		player_selected_screen._ready()
		player_screen.texture = selected_screen.get_texture()
		player_screen_colision.collision_layer = player.collision_layer
		player_screen.visible = true
