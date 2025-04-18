class_name Player extends CharacterBody2D


const SPEED = 300.0
var speed = 1
#const JUMP_VELOCITY = -400.0

@export var inventory: Inventory
@onready var _animated_sprite = $AnimatedSprite2D


var is_chatting = false
var player_in_chatzone = false
var alive = true


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("chat") && player_in_chatzone:
		is_chatting = true
	#print(player_in_chatzone)
	#print(is_chatting)

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("dash"):
		speed = 2
		_animated_sprite.speed_scale = 3
	else:
		speed = 1
		_animated_sprite.speed_scale = 1
	
	if (!is_chatting):
		var direction := Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED * speed
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED*speed)

		var directionY := Input.get_axis("up", "down")
		if directionY:
			velocity.y = directionY * SPEED*speed
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED*speed)

		move_and_slide()
		handleCollision()
		updateAnimation()
		#if !alive:
			#death_counter.increment_sec(delta*6)
			#if death_counter.date_time.seconds:
				#print("you died")
				#pass
				##play death scene
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Villagers"):
		player_in_chatzone = true

func handleCollision():
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i);
		var collider = collision.get_collider();
		#print(collider.name)
		
func updateAnimation():
	var currSprite = _animated_sprite.animation;
	var spriteString = currSprite;
	var string1
	var string2
	
	if !alive:
		_animated_sprite.play("die")
		return
	
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
	spriteString = string1 + "_" + string2
	_animated_sprite.play(spriteString)

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Villagers"):
		player_in_chatzone = false
		
func disable() -> void:
	process_mode = ProcessMode.PROCESS_MODE_DISABLED


func _on_hurt_box_area_entered(area: Area2D) -> void:
	if area.name == "hitBox":
		alive = false;
		#print_debug("test"+area.get_parent().name)
		
