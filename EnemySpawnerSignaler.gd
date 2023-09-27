extends Node

signal spawn_enemy(spawner)
signal defeated_enemies
signal lost_spaceship

@export var enemies_to_spawn = 30
var remaining_enemies = 0
var num_defeated_enemies = 0
var spaceship_health = 3

func _ready():
	remaining_enemies = enemies_to_spawn

func _process(delta):
	if num_defeated_enemies >= enemies_to_spawn:
		emit_signal("defeated_enemies")
		set_process(false)
	if spaceship_health <= 0:
		emit_signal("lost_spaceship")
		set_process(false)


func _on_timer_timeout():
	if remaining_enemies > 0:
		remaining_enemies -= 1
		var all_spawners = get_tree().get_nodes_in_group("spawners")
		var spawner = all_spawners.pick_random()
		emit_signal("spawn_enemy", spawner)
