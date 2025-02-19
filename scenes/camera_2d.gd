extends Camera2D

@onready var player = %Player

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var playerPos = player.position.x
	position.x = playerPos
	pass
