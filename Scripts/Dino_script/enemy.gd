extends Node3D

@onready var animation = $AnimationPlayer
@export var pathFollow3D: PathFollow3D
@export var volume:float = -30
@export var rng_max = 20000
var rng = RandomNumberGenerator.new()


var can_be_visible = false
@onready var palmtop = get_node("/root/AlanScenen/Player/screen_player/screen_colision/screen_image")
@onready var audio = get_node("/root/AlanScenen/Player/screen_player/AudioStreamPlayer3D")
@onready var timer = get_node("/root/AlanScenen/Room/computer/screens/Timer")

var sfx

# Called when the node enters the scene tree for the first time.
func _ready():
	sfx = load("res://Songs/jumpscare.wav") 
	#sfx = load("res://Songs/button.mp3") 
	audio.stream = sfx
	audio.volume_db = volume
	self.visible = false
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animation.play("idle")

	if can_be_visible:
		rng.randomize()
		if rng.randi_range(0,rng_max) == 1:
			self.visible = true
			audio.play()
			can_be_visible = false
			timer.start()


func _on_timer_timeout():
	self.visible = false
	pass # Replace with function body.
