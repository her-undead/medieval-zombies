class_name Credits extends Control

@onready var exit = $TextureButton

func _on_texture_button_button_down() -> void:
	get_tree().call_deferred('change_scene_to_file', "res://scenes/GUI/start_menu.tscn")
