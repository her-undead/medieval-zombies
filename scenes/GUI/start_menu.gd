class_name StartMenu

extends Control

@onready var start_button = $MarginContainer/VBoxContainer/Start as Button
@onready var exit_button = $MarginContainer/VBoxContainer/Exit_Button as Button
@onready var start_game = preload("res://scenes/locations/home.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	start_button.button_down.connect(on_start_pressed)
	exit_button.button_down.connect(on_exit_pressed)

func on_start_pressed() -> void:
	get_tree().call_deferred('change_scene_to_file', "res://scenes/locations/home.tscn")
	
func on_exit_pressed() -> void:
	pass
