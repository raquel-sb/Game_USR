extends Control

@export var path_scene_options : String



func _on_new_pressed() -> void:
	pass # Replace with function body.


func _on_continue_pressed() -> void:
	pass # Replace with function body.


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file(path_scene_options)


func _on_credits_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
