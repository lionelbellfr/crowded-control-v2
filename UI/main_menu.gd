extends Control

@onready var button_play = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/ButtonPlay
@onready var button_settings = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/ButtonSettings
@onready var button_quit = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/ButtonQuit

func _on_button_play_pressed():
	get_tree().change_scene_to_file("res://levels/level_1.tscn")
	pass # Replace with function body.


func _on_button_settings_pressed():
	get_tree().change_scene_to_file("res://UI/settings.tscn")
	pass # Replace with function body.


func _on_button_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
