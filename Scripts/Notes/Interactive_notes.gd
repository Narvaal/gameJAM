class_name Notes 
extends StaticBody3D

@onready var player = get_node("/root/AlanScenen/Player")
@onready var note = get_node("/root/AlanScenen/Player/Head/Vertical/InteractRayCast/note")
@onready var sprite = get_node("/root/AlanScenen/Player/Head/Vertical/InteractRayCast/note/StaticBody3D/CollisionShape3D/Sprite3D")
@onready var note_sound = get_node("/root/AlanScenen/Player/screen_player/AudioStreamPlayer3D")
@onready var sprite_globe = $CollisionShape3D/Sprite3D

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
	sprite.texture = sprite_globe.texture
	note_sound.play()

