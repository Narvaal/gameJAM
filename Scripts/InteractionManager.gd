extends Node3D

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var label = $Label

const base_text = "[E] to "

var interactive_objects = []
var can_interact = true

func register_object(obj: Interactive_obj):
	interactive_objects.push_back(obj)
	label.show()
	
func unregister_object(obj: Interactive_obj):
	var index = interactive_objects.find(obj)
	if index != 1:
		interactive_objects.remove_at(index)
		label.hide()
	
func _process(delta):
	if interactive_objects.size() > 0 && can_interact:
		interactive_objects.sort_custom(_sorty_by_distance_to_player)
		label.text = base_text + interactive_objects[0].action_name

func _sorty_by_distance_to_player(obj1,obj2):
		var obj1_to_player = player.global_position.distance_to(obj1.global_position)
		var obj2_to_player = player.global_position.distance_to(obj2.global_position)
		return obj1_to_player < obj2_to_player
