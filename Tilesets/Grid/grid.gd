extends TileMap

enum { EMPTY = -1, ACTOR, OBSTACLE , OBJECT, BORDER  }

func _ready():
	for child in get_children():
		set_cell(0, local_to_map(to_local(child.position)), 0, Vector2i(0, 0), child.type) 
		#For TileSetScenesCollectionSource, atlas_coords should always be Vector2i(0, 0)
		#alternative_tile identifies the scene for a TileSetScenesCollectionSource

func get_cell_pawn(coordinates):
	for node in get_children():
		if local_to_map(to_local(node.position)) == coordinates:
			return(node)


func request_move(pawn, direction):
	var cell_start = local_to_map(to_local(pawn.position))
	var cell_target = cell_start + direction
	
	var cell_target_type = get_cell_alternative_tile(0, cell_target)
	match cell_target_type:
		EMPTY:
			return update_pawn_position(pawn, cell_start, cell_target)
		OBJECT:
			var object_pawn = get_cell_pawn(cell_target)
			object_pawn.queue_free()
			return update_pawn_position(pawn, cell_start, cell_target)
		ACTOR:
			var pawn_name = get_cell_pawn(cell_target).name
			print("Cell %s contains %s" % [cell_target, pawn_name])
		BORDER:
			pass

func update_pawn_position(pawn, cell_start, cell_target):
	#these calls should paint the ground in the corresponding pawn type
	#set_cell(0, cell_target, 0, Vector2i(0, 0), pawn.type) 
	set_cell(0, cell_start, 0, Vector2i(0, 0), EMPTY) 
	return map_to_local(to_global(cell_target)) #+ Vector2(cell_quadrant_size, cell_quadrant_size) / 2
