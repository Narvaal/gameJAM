extends Node3D

@onready var animation = $AnimationPlayer
@export var pathFollow3D: PathFollow3D
# Called when the node enters the scene tree for the first time.
func _ready():
	#animation.play_backwards("TRex_Walk")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animation.play("TRex_Walk")
	#const move_speed := 10
	
	#pathFollow3D.progress += move_speed * delta
	pass
