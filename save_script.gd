class_name SaveScript
extends Node

var levels = 0
static var levels_available = []

func _ready():
	var path = "res://levels"
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				levels_available.push_back(false)
				print("Found file: " + file_name)
			file_name = dir.get_next()
		levels_available[0] = true
	else:
		print("An error occurred when trying to access the path.")
	
