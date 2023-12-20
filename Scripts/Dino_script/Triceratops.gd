extends Node3D

@onready var animation = $AnimationPlayer
@export var pathFollow3D: PathFollow3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#animation.play_backwards("Triceratops_Walk")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	animation.play_backwards("Triceratops_Walk")
	#const move_speed := 10
	#
	#%PathFollow3D.Progress += move_speed * delta
	pass

#func _physics_process(delta: float) -> void:
	#const move_speed := 4.0
	#pathFollow3D. += move_speed * delta
