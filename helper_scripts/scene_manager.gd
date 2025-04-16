class_name SceneManager extends Node

var player: Player
var last_scene_name: String

var sus_level = 0

var pages = [true, false, false, false, false, true]

var scene_dir_path = "res://scenes/locations/"

func add_page():
	for p in pages.size():
		if !pages[p]:
			print(pages[p])
			pages[p] = true;
			print(pages[p])
			
			break;
	print(pages)

func change_scene(from, to_scene_name: String) -> void:
	last_scene_name = from.name
	player = from.player
	player.get_parent().remove_child(player)
	
	var full_path = scene_dir_path + to_scene_name + ".tscn"
	from.get_tree().call_deferred('change_scene_to_file', full_path)
