extends GridContainer

export (PackedScene) var CellPrefab = null
export (PackedScene) var SniperPrefab = null

var pressed_couple:PressedCouple = PressedCouple.new()

func _ready():
	_generate_table()
	pressed_couple.connect("require_movement", self, "_make_movement")

func _generate_table():
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
	if(is_pressed):
		pressed_couple.append_to_couple(buttonRef)
	else:
		pressed_couple.remove_from_couple(buttonRef)

func _make_movement(first_cell:GridCell, second_cell:GridCell):
	var first_cell_child:Sniper = first_cell.get_child(0)
	var second_cell_child= second_cell.get_child(0)
	#fail rules
	if(!first_cell_child):#first cell not occupied
		print("Ilegal move, first selected is not a sniper")
		return
	if(second_cell_child):#second cell occupied
		print("Ilegal move, second selected is occupied")
		return
	var y_variation = second_cell.grid_position.x - first_cell.grid_position.x
	var x_variation = second_cell.grid_position.y - first_cell.grid_position.y
	#legal: (1,0) (0,1) / ilegal: (2,1), (1,1), (4,5), (0,9)...
	var is_10 = (abs(x_variation)==1) and (abs(y_variation)==0)
	var is_01 = (abs(x_variation)==0) and (abs(y_variation)==1)
	if( not(is_10 or is_01) ):
		print("Ilegal move, moved more than one grid")
		return
	#succeeded movement
	first_cell.remove_child(first_cell_child)
	second_cell.add_child(first_cell_child)
	#changing rotation
	if(x_variation>0):
		first_cell_child.face_right()
	elif(x_variation<0):
		first_cell_child.face_left()
	elif(y_variation>0):
		first_cell_child.face_bot()
	elif(y_variation<0):
		first_cell_child.face_top()
	print("variation: (%d,%d)" %[x_variation,y_variation])
