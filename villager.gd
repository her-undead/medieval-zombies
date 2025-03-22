extends CharacterBody2D

var player
var player_in_chatzone = false
var is_chatting = false
var suspicion_level = 0
var sus = false

func _process(delta):
	if suspicion_level > 1:
		sus = true
	if player_in_chatzone && !is_chatting:
		if Input.is_action_just_pressed("chat"):
			$Dialogue.start(sus)
			is_chatting = true
			print("chatting")
			suspicion_level += 1

func _on_detect_closeness_body_entered(body: Node2D) -> void:
		if body.name == "Player":
			print("entered")
			player = body
			player_in_chatzone = true

func _on_detect_closeness_body_exited(body: Node2D) -> void:
		if body.name == "Player":
			player_in_chatzone = false


func _on_dialogue_dialogue_finished() -> void:
	is_chatting = false
	player_in_chatzone = false
