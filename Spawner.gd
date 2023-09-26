extends Node2D

var enemy_scene = preload("res://Enemies/enemy_1.tscn")
@export var enemy_direction = Vector2.RIGHT

var tile_size = 32
var offset = 64

func _ready():
	add_to_group("spawners")
	var spawner_signaler_node = get_tree().get_first_node_in_group("spawnersignaler")
	spawner_signaler_node.spawn_enemy.connect(_on_spawn_enemy)

#posso fare un segnale lanciato da un nodo spawner principale e tutti questi

func _on_spawn_enemy(spawner):
	if self == spawner:
		var enemy = enemy_scene.instantiate() as Node2D
		enemy.direction = enemy_direction
		var enemy_container = get_tree().get_nodes_in_group("entities")[0]
		enemy_container.add_child(enemy)
		enemy.global_position.y = self.global_position.y
		enemy.global_position.x = self.global_position.x
