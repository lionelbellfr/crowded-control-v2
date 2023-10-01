extends Control

const LEVEL_BTN = preload("res://UI/level_button.tscn")
@export_dir var dir_path

@onready var grid = $ColorRect/MarginContainer/VBoxContainer
func _ready() -> void:
	get_levels(dir_path)

func get_levels(path):
	var dir = DirAccess.open(path)

	#var dir = DirAccess.new()
	if dir != null:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			print(file_name)
			create_level_btn('%s/%s' % [dir.get_current_dir(), file_name], file_name)
			file_name = dir.get_next()
		dir.list_dir_end()
	else:
		print("An error occurred when trying to access the path.")
		
		
func create_level_btn(lvl_path, lvl_name):
	var btn = LEVEL_BTN.instantiate()
	btn.text = lvl_name.trim_suffix('.tscn').replace("_", " ")
	btn.level_path = lvl_path
	btn.custom_minimum_size = Vector2(180, 60)
	btn.add_theme_font_size_override("font_size", 40)
	grid.add_child(btn)


func _on_button_back_pressed():
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")
	pass # Replace with function body.
