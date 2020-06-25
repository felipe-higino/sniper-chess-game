extends GridContainer

export (PackedScene) var CellPrefab = null
export (PackedScene) var SniperPrefab = null

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

func _grid_pressed(buttonRef):
	print(buttonRef.grid_position)
