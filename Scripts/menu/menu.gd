extends Control



func _ready():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	pass 


func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/alan_scenen.tscn")



func _on_button_2_pressed():
	get_tree().quit()

