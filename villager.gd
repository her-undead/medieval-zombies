extends CharacterBody2D

@onready var player = %Player
var player_in_chatzone = false
var is_chatting = false
var suspicion_level = 0
var sus = false

@export var list_of_dialogues = []
@export var sprite = Image
@export var sus_threshold : int
@export var base_sus : int

func _process(delta):
	$Sprite2D.set_texture(sprite)
	$Sprite2D.scale = Vector2(0.15, 0.15)
	suspicion_level = scene_manager.sus_level
	if suspicion_level >= sus_threshold:
		sus = true
	if player_in_chatzone && !is_chatting:
		if Input.is_action_just_pressed("chat"):
			$Dialogue.start(sus, list_of_dialogues)
			is_chatting = true
			print("chatting")
			suspicion_level += base_sus
			scene_manager.sus_level = suspicion_level
	if is_chatting:
		player.is_chatting = true
	#print(is_chatting)
			

func _on_detect_closeness_body_entered(body: Node2D) -> void:
		if body is Player:
			#print("entered")
			player = body
			player_in_chatzone = true

func _on_detect_closeness_body_exited(body: Node2D) -> void:
		if body is Player:
			player_in_chatzone = false


func _on_dialogue_dialogue_finished() -> void:
	is_chatting = false
	player_in_chatzone = false
	player.is_chatting = false
	player.player_in_chatzone = false
	#player.get_parent().is_chatting = false
