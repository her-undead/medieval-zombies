extends Control

@export_file("*.json") var d_file

var dialogue = []
var current_dialogue_idx = 0

var dialogue_active = false

signal dialogue_finished

func _ready():
	$NinePatchRect.visible = false
	
func start(suspicious: bool):
	if dialogue_active:
		return
	dialogue_active = true
	$NinePatchRect.visible = true
	if suspicious:
		dialogue = load_sus_dialogue()
	else:
		dialogue = load_dialogue()
	current_dialogue_idx = -1
	next_script()
	
func load_dialogue():
	var file = FileAccess.open("res://scenes/characters/villagerA.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content
	
func load_sus_dialogue():
	var file = FileAccess.open("res://scenes/characters/villagerAsus.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content
	
func _input(event):
	if !dialogue_active:
		return
	if event.is_action_pressed("chat"):
		next_script()
	
func next_script():
	current_dialogue_idx += 1
	if current_dialogue_idx >= len(dialogue):
		dialogue_active = false
		$NinePatchRect.visible = false
		emit_signal("dialogue_finished")
		return
		
	$NinePatchRect/Name.text = dialogue[current_dialogue_idx]['name']
	$NinePatchRect/Text.text = dialogue[current_dialogue_idx]['text']
