class_name Page extends Sprite2D

var taken = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true

func pick_up():
	visible = false;
	#call the add page function in book ui
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
