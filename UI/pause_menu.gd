extends Control



func _process(delta):
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = not get_tree().paused
		self.visible = not self.visible


func _on_button_resume_pressed():
	get_tree().paused = false
	self.visible = not self.visible


func _on_button_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")
