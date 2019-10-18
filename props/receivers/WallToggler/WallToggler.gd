extends "res://props/receivers/Receiver.gd"

onready var grid: TileMap = owner.get_node("Grid")

func _on_enabled_call(id_list):
	if id_list.has(id):
		toggle()

func _on_disabled_call(id_list):
	if id_list.has(id):
		toggle()

func toggle():
	var loc = grid.world_to_map(position)
	var cell_type = grid.get_cellv(loc)
	match cell_type:
		grid.CellType.EMPTY:
			grid.set_cellv(loc, grid.CellType.OBSTACLE)
		grid.CellType.OBSTACLE:
			grid.set_cellv(loc, grid.CellType.EMPTY)