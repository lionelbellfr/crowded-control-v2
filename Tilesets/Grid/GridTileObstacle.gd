extends Node2D
var grid

func _ready():
	grid = get_tree().get_first_node_in_group("grid")

func _on_area_2d_area_entered(area):
	var area_node = area.get_parent()
	if area_node.rush_bullet:
		var actual_position = position + Vector2(64, 0)
		grid.set_cell(0, grid.local_to_map(grid.to_local(actual_position)), 0, Vector2i(0, 0), -1) 
		queue_free()
	pass # Replace with function body.
