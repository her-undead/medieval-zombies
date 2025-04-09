class_name FollowScript extends Node

@export var speed = 50;
@onready var parent: CharacterBody2D = get_parent()

var start_position
var target: Player

# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = parent.position

func update_velocity():
	if !target: return
	
	var direction = target.global_position - parent.global_position
	var new_velocity = direction.normalized() * speed
	parent.velocity = new_velocity

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	update_velocity()
	parent.move_and_slide()

func disable() -> void:
	process_mode = ProcessMode.PROCESS_MODE_DISABLED

func _on_follow_area_body_entered(body):
	if body is Player:
		target = body;
		print("hi")
		
