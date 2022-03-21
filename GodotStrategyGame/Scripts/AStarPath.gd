extends TileMap

class_name AstarPath

onready var astar = AStar2D.new()
onready var usedCells = get_used_cells()

var path : PoolVector2Array

func _ready():
	AddPoints()
	ConnectPoints()
	
func AddPoints():
	for cell in usedCells:
		astar.add_point(id(cell),cell, 1.0)

func ConnectPoints():
	for cell in usedCells:
		var neighbors = [Vector2(1,0),Vector2(-1,0),Vector2(0,1),Vector2(0,-1)]
		for neighbor in neighbors:
			var nextCell = cell + neighbor
			if usedCells.has(nextCell):
					astar.connect_points(id(cell),id(nextCell), false)
					
func GetPath(start,end):
	path = astar.get_point_path(id(start),id(end))
	path.remove(0)
	
func id(point):
	var a = point.x
	var b = point.y
	return (a+b) * (a+b +1) / 2 +b
