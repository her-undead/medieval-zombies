extends Control

@export_file("*.json") var d_file

var dialogue = []
var current_dialogue_idx = 0

@export var list_of_dialogues = []

var dialogue_active = false

var waiting_for_choice = false

var A_idx
var B_idx

signal dialogue_finished

var d_list = []

func _ready():
	$NinePatchRect.visible = false
	
func start(suspicious: bool, list: Array):
	print("start")
	d_list = list
	if dialogue_active:
		return
	dialogue_active = true
	$NinePatchRect.visible = true
	if suspicious:
		dialogue = load_dialogue(0)
	else:
		dialogue = load_dialogue(1)
	current_dialogue_idx = -1
	next_script()
	
func load_dialogue(idx: int):
	print("load dialogue")
	var file = FileAccess.open(d_list[idx], FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content
	
func _input(event):
	if waiting_for_choice:
		print("waiting")
		if event.is_action_pressed("ChoiceA"):
			waiting_for_choice = false
			dialogue = load_dialogue(A_idx)
			current_dialogue_idx = -1
			next_script()
		if event.is_action_pressed("ChoiceB"):
			waiting_for_choice = false
			dialogue = load_dialogue(B_idx)
			current_dialogue_idx = -1
			next_script()
	else:
		if !dialogue_active:
			return
		if event.is_action_pressed("chat"):
			next_script()

	
func next_script():
	print("next script")
	current_dialogue_idx += 1
	if current_dialogue_idx >= len(dialogue):
		dialogue_active = false
		$NinePatchRect.visible = false
		emit_signal("dialogue_finished")
		return
		
	if dialogue[current_dialogue_idx]['choice'] == "1":
		print("Choice")
		waiting_for_choice = true
		$NinePatchRect/Name.text = dialogue[current_dialogue_idx]['name']
		$NinePatchRect/Text.text = dialogue[current_dialogue_idx]['text']
		A_idx = int(dialogue[current_dialogue_idx]['A'])
		B_idx = int(dialogue[current_dialogue_idx]['B'])
	else:	
		$NinePatchRect/Name.text = dialogue[current_dialogue_idx]['name']
		$NinePatchRect/Text.text = dialogue[current_dialogue_idx]['text']
		
	
