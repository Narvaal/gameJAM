extends Node3D

@onready var animation = $AnimationPlayer
@export var pathFollow3D: PathFollow3D
var rng = RandomNumberGenerator.new()

@onready var palmtop = get_node("/root/AlanScenen/Player/screen_player/screen_colision/screen_image")
@onready var audio = get_node("/root/AlanScenen/Player/screen_player/AudioStreamPlayer3D")
var sfx

# Called when the node enters the scene tree for the first time.
func _ready():
	sfx = load("res://Songs/jumpscare.wav") 
	self.visible = false
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animation.play("idle")

	rng.randomize()
	if rng.randi_range(0,50000) == 1:
		self.visible = true
		
		if palmtop.visible == true:
			
			audio.stream = sfx
			audio.play()
		
		
	rng.randomize()
	if rng.randi_range(0,200) == 1:
		self.visible = false
	
	#pathFollow3D.progress += move_speed * delta
	pass
