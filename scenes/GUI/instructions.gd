class_name Instructions extends Node2D

@onready var exit = $Control/ExitButton

func _on_exit_button_button_down() -> void:
	get_tree().call_deferred('change_scene_to_file', "res://scenes/GUI/start_menu.tscn")
