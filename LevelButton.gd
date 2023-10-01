extends Button

@export_file var level_path
var original_size := scale
var grow_size := Vector2(1.1, 1.1)
var button_label: String
var level_number: String
@onready var click_audio = $ClickAudio

func _ready():
	if level_path != null:
		print(level_path)
		level_number = level_path.trim_prefix("res://levels/level_").trim_suffix(".tscn")
		var level_number_int = int(level_number)
		if SaveScript.levels_available[level_number_int - 1]:
			set_disabled(false)
		else:
			set_disabled(true)

func _on_mouse_entered():
	#grow_button(grow_size, 0.1)
	pass # Replace with function body.


func _on_mouse_exited():
	#grow_button(original_size, 0.1)
	pass # Replace with function body.


func grow_button(end_size: Vector2, duration: float) -> void:
	var tween := create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, 'scale', end_size, duration)


func _on_pressed():
	if level_path == null:
		return
	click_audio.play()
	get_tree().change_scene_to_file(level_path)
	pass # Replace with function body.
