extends AstarPath

onready var unit = $Unit

var moving = 0

func _input(event):
	if(event is InputEventMouseButton && event.is_pressed() && event.button_index == BUTTON_LEFT) && moving == 0:
			var mouse_pos = world_to_map(get_global_mouse_position())
			if usedCells.has(mouse_pos):
				var unit_pos = world_to_map(unit.global_position)
				GetPath(unit_pos, mouse_pos)
				move()
	
func move():
	moving = 1
	set_cellv(path[path.size()-1],1)
	
	for p in path:
		unit.global_position = map_to_world(p)
		yield(get_tree().create_timer(0.1), "timeout")
	
	set_cellv(path[path.size()-1],0)
	moving = 0

