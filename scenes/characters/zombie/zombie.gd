extends CharacterBody2D

@onready var target = %Player

const SPEED = 150.0

func _physics_process(delta: float) -> void:
	## Add the gravity.
	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = (target.position-position).normalized()
	velocity = direction * SPEED
	look_at(target.position)
	move_and_slide()
