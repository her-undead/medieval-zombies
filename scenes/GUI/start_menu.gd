class_name StartMenu

extends Control

@onready var start_button = $MarginContainer/VBoxContainer/StartButton
@onready var exit_button = $MarginContainer/VBoxContainer/ExitButton
@onready var controls_button = $MarginContainer/VBoxContainer/ControlsButton
@onready var credits_button = $MarginContainer/VBoxContainer/CreditsButton
@onready var start_game = preload("res://scenes/locations/home.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	start_button.button_down.connect(on_start_pressed)
	exit_button.button_down.connect(on_exit_pressed)
	controls_button.button_down.connect(on_controls_pressed)
	credits_button.button_down.connect(on_credits_pressed)

func on_start_pressed() -> void:
	get_tree().call_deferred('change_scene_to_file', "res://scenes/locations/home.tscn")
	
func on_exit_pressed() -> void:
	get_tree().quit()
	
func on_credits_pressed() -> void:
	get_tree().call_deferred('change_scene_to_file', "res://scenes/GUI/credits.tscn")

func on_controls_pressed() -> void:
	get_tree().call_deferred('change_scene_to_file', "res://scenes/GUI/instructions.tscn")
