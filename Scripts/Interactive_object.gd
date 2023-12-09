extends Area3D
class_name Interactive_obj

@export_category("Settings Interaction")
@export var action_name: String = "Interact"


var interact: Callable = func():
	pass

func _on_body_entered(body):
	InteractionManager.register_object(self)


func _on_body_exited(body):
	InteractionManager.unregister_object(self)
