extends Control

@onready var button_play = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/ButtonPlay
@onready var button_settings = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/ButtonSettings
@onready var button_quit = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/ButtonQuit
@onready var click_audio = $ClickAudio


func _on_button_play_pressed():
	click_audio.play()
	get_tree().change_scene_to_file("res://UI/level_select.tscn")
	pass # Replace with function body.


func _on_button_settings_pressed():
	click_audio.play()
	get_tree().change_scene_to_file("res://UI/settings.tscn")
	pass # Replace with function body.


func _on_button_quit_pressed():
	click_audio.play()
	get_tree().quit()
	pass # Replace with function body.
