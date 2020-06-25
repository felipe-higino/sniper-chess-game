extends GridContainer

export (PackedScene) var CellPrefab = null
export (PackedScene) var SniperPrefab = null

class PressedCouple:
	var first_cell:GridCell = null
	var second_cell:GridCell = null
	func append_to_couple(cell:GridCell):
		if(!first_cell):
			first_cell = cell
		elif(!second_cell):
			second_cell = cell
	func remove_from_couple(cell:GridCell):
		var cell_grid_position = cell.grid_position
		if(first_cell && first_cell.grid_position == cell_grid_position):
			first_cell = null
		elif(second_cell && second_cell.grid_position == cell_grid_position):
			second_cell = null

var pressed_couple:PressedCouple = PressedCouple.new()

func _ready():
	for i in 11:
		for j in 11:
			#generate buttons
			var new_button = CellPrefab.instance()
			new_button.grid_position = Vector2(i,j);
			new_button.connect("cell_clicked", self, "_grid_pressed")
			add_child(new_button)
			#generate snipers
			#-- red ones
			if( (i==0) || (i>0 && i<10 && j==10) ):
				var sniper = SniperPrefab.instance()
				sniper.set_team_red()
				new_button.add_child(sniper)
				if(i==0):
					sniper.face_top()
				else:
					sniper.face_right()
			#-- blue ones
			if( (j==0 && i>0) || (i==10) ):
				var sniper = SniperPrefab.instance()
				sniper.set_team_blue()
				new_button.add_child(sniper)
				if(i==10):
					sniper.face_bot()
				else:
					sniper.face_left()

func _grid_pressed(buttonRef, is_pressed):
	var selected_sniper = buttonRef.get_child(0)
	print(buttonRef.grid_position)
	if(is_pressed):
		pressed_couple.append_to_couple(buttonRef)
	else:
		pressed_couple.remove_from_couple(buttonRef)
	print(pressed_couple.first_cell)
	print(pressed_couple.second_cell)
