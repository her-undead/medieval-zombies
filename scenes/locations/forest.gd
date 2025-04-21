extends BaseScene
@onready var camera = $Camera2D

var death_start: int

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	camera.follow_node = player
	pass # Replace with function body.


func _on_time_system_updated(date_time: DateTime) -> void:
	if player.alive:
		death_start = date_time.seconds;
	else:
		print_debug("dying")
		if date_time.seconds - death_start > 6:
			get_tree().call_deferred('change_scene_to_file', "res://scenes/GUI/death_scene.tscn")
			print("you died")
