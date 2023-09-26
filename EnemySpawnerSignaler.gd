extends Node

signal spawn_enemy(spawner)

@export var enemies_to_spawn = 30

func _on_timer_timeout():
	if enemies_to_spawn > 0:
		enemies_to_spawn -= 1
		var all_spawners = get_tree().get_nodes_in_group("spawners")
		var spawner = all_spawners.pick_random()
		emit_signal("spawn_enemy", spawner)
