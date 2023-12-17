extends Node

@export_category("Camera Movement")
@export var value_moved = 0.01
@export var value_moved_max = 5
@export var value_moved_min = -5

var moved = 0.0

func _process(delta):
	self.rotation_degrees.y += value_moved
	moved += value_moved
	if moved >= value_moved_max or moved <= value_moved_min:
		value_moved *= -1	
	
