class_name PickUp extends Node

@onready var parent: Sprite2D = get_parent()

var start_position
signal picked

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_position = parent.position
	#var second = get_node("/root/scene_manager")
	#second.connect("picked", add_page, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pick_up_area_body_entered(body: Node2D) -> void:
	if body is Player:
		scene_manager.add_page()
		print("got page")
		parent.queue_free();
		
		
