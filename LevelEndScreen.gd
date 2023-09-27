extends Control

@onready var win_screen = $WinScreen
@onready var lose_screen = $LoseScreen


func _ready():
	var signaler = get_tree().get_first_node_in_group("spawnersignaler")
	signaler.defeated_enemies.connect(_on_defeated_enemies)
	signaler.lost_spaceship.connect(_on_lost_spaceship)

func _on_defeated_enemies():
	print("got signal")
	self.visible = true
	get_tree().paused = true
	win_screen.visible = true
	lose_screen.visible = false
	pass

func _on_lost_spaceship():
	self.visible = true
	get_tree().paused = true
	win_screen.visible = false
	lose_screen.visible = true
	pass

func _on_button_next_pressed():
	get_tree().paused = false
	pass # Replace with function body.


func _on_button_win_quit_toggled():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")
	pass # Replace with function body.


func _on_button_retry_pressed():
	get_tree().paused = false
	pass # Replace with function body.


func _on_button_lose_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")
	pass # Replace with function body.
