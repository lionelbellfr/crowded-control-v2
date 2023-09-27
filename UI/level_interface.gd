extends Control

@onready var label_enemies = $MarginContainer/LabelEnemies
@onready var label_health = $MarginContainer/LabelHealth
@onready var spawner_node = get_tree().get_first_node_in_group("spawnersignaler")

func _process(delta):
	label_enemies.text = "Remaining Enemies: " + String.num_int64(spawner_node.num_defeated_enemies) + "/" + String.num_int64(spawner_node.enemies_to_spawn)
	
	label_health.text = "Health: " + String.num_int64(spawner_node.spaceship_health)
