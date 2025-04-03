class_name FollowScript extends Node

@export var speed = 50;
@onready var parent: CharacterBody2D = get_parent()

var start_position
var target: Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_position = parent.position

func update_velocity():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	parent.move_and_slide()
