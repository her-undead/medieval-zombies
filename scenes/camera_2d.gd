extends Camera2D

@export var follow_node: Node2D

@onready var player = Player

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var playerPos = follow_node.position.x
	position.x = playerPos
	pass
