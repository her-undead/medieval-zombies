class_name BaseScene extends Node

@onready var player: Player = $Player
@onready var entrance_markers: Node2D = $EntranceMarkers
# Called when the node enters the scene tree for the first time.
func _ready():
	if scene_manager.player:
		if player:
			player.queue_free()
			
		player = scene_manager.player
		add_child(player)
		
func position_player() -> void:
	for entrance in entrance_markers.get_children():
		if entrance is Marker2D and entrance.name =="any":
			print("entrance: "+ entrance.global_position);
			print(player.global_position);
			player.global_position = entrance.global_position
