extends CharacterBody2D

@export var speed = 50;
@export var limit = 0.5;
@export var endPoint: Marker2D

var startPosition
var endPosition
@onready var _animated_sprite = $AnimatedSprite2D

func _ready():
	startPosition = position
	endPosition = endPoint.global_position
	
func changeDirection():
	var tempEnd = endPosition
	endPosition = startPosition
	startPosition = tempEnd

func updateVelocity():
	var moveDirection = endPosition - position
	if moveDirection.length() < limit:
		changeDirection()
	velocity = moveDirection.normalized() * speed
	
func updateAnimation():
	var spriteString = "left"
	if velocity.x > 0:
		spriteString = "right"
	_animated_sprite.play(spriteString)
	
func _physics_process(delta: float) -> void:
	updateVelocity()
	move_and_slide()
	updateAnimation()
