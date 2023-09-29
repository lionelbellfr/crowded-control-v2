class_name EndScreen
extends Control

@onready var win_screen = $WinScreen
@onready var lose_screen = $LoseScreen
static var level_ended = false

func _ready():
	level_ended = false
	var signaler = get_tree().get_first_node_in_group("spawnersignaler")
	signaler.defeated_enemies.connect(_on_defeated_enemies)
	signaler.lost_spaceship.connect(_on_lost_spaceship)

func _on_defeated_enemies():
	level_ended = true
	self.visible = true
	get_tree().paused = true
	win_screen.visible = true
	lose_screen.visible = false


func _on_lost_spaceship():
	level_ended = true
	self.visible = true
	get_tree().paused = true
	win_screen.visible = false
	lose_screen.visible = true


func _on_button_next_pressed():
	level_ended = false
	get_tree().paused = false


func _on_button_retry_pressed():
	level_ended = false
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_button_lose_quit_pressed():
	level_ended = false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")


func _on_button_win_quit_pressed():
	level_ended = false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")
