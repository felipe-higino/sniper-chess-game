extends Node

class_name PressedCouple

var first_cell:GridCell = null
var second_cell:GridCell = null
signal require_movement(first_cell, second_cell)

func append_to_couple(cell:GridCell):
	if(!first_cell):
		first_cell = cell
	elif(!second_cell):
		second_cell = cell
	if(first_cell && second_cell):
		emit_signal("require_movement", first_cell, second_cell)
		first_cell.pressed = false
		first_cell = null
		second_cell.pressed = false
		second_cell = null

func remove_from_couple(cell:GridCell):
	var cell_grid_position = cell.grid_position
	if(first_cell && first_cell.grid_position == cell_grid_position):
		first_cell = null
	elif(second_cell && second_cell.grid_position == cell_grid_position):
		second_cell = null
