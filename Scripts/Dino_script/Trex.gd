extends Node3D

@onready var animation = $AnimationPlayer
@export var pathFollow3D: PathFollow3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#animation.play_backwards("TRex_Walk")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animation.play("TRex_Walk")
	const move_speed := 5
	
	pathFollow3D.progress += move_speed * delta
	pass

#func _physics_process(delta: float) -> void:
	#const move_speed := 4.0
	#$"../../Path3D/PathFollow3D".progress += move_speed * delta
