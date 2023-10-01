extends Control

@onready var volume = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/Volume
@onready var button_fullscreen = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/ButtonFullscreen
@onready var button_menu = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/ButtonMenu

@onready var screen_script_node = get_node("/root/Screen")

func _on_button_fullscreen_pressed():
	if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_FULLSCREEN:
		screen_script_node.set_fullscreen()
	else:
		screen_script_node.set_windowed()
	pass # Replace with function body.


func _on_button_menu_pressed():
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")
	pass # Replace with function body.
