extends Control
class_name DeathScene

@onready var return_button = $ReturnButton
@onready var exit_button = $ExitButton
@onready var start_game = preload("res://scenes/locations/home.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	return_button.button_down.connect(on_return_pressed)
	exit_button.button_down.connect(on_exit_pressed)

func on_return_pressed() -> void:
	get_tree().call_deferred('change_scene_to_file', "res://scenes/locations/home.tscn")

func on_exit_pressed() -> void:
	get_tree().call_deferred('change_scene_to_file', "res://scenes/GUI/start_menu.tscn")
