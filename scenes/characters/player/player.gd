class_name Player extends CharacterBody2D


const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

@export var inventory: Inventory
@onready var _animated_sprite = $AnimatedSprite2D

var is_chatting = false
var player_in_chatzone = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("chat") && player_in_chatzone:
		is_chatting = true
	#print(player_in_chatzone)
	#print(is_chatting)

func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	#if not is_on_floor():
	#	print("not falling")
	#	velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if (!is_chatting):
		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		var directionY := Input.get_axis("ui_up", "ui_down")
		if directionY:
			velocity.y = directionY * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)

		move_and_slide()
		updateAnimation()
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Villagers"):
		player_in_chatzone = true

func updateAnimation():
	var currSprite = _animated_sprite.animation;
	var spriteString = currSprite;
	var string1
	var string2
	
	if currSprite.contains("left"):
		string2 = "left"
	else:
		string2 = "right"
	if velocity == Vector2(0,0):
		string1 = "idle"
	else:
		string1 = "walk"
	if velocity.x > 0 :
		string2 = "right"
	elif velocity.x < 0:
		string2 = "left"
	print(string1 + "_" + string2)
	spriteString = string1 + "_" + string2
	_animated_sprite.play(spriteString)

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Villagers"):
		player_in_chatzone = false
		
