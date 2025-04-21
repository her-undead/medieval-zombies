extends Control
class_name DeathScene

@onready var replay_button = $ReplayButton
@onready var exit_button = $ReturnButton
@onready var start_game = preload("res://scenes/locations/home.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	replay_button.button_down.connect(on_replay_pressed)
	exit_button.button_down.connect(on_exit_pressed)

func on_replay_pressed() -> void:
	get_tree().call_deferred('change_scene_to_file', "res://scenes/locations/home.tscn")
	scene_manager.reset_pages();
func on_exit_pressed() -> void:
	get_tree().call_deferred('change_scene_to_file', "res://scenes/GUI/start_menu.tscn")
