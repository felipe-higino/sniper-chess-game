extends GridContainer

export (PackedScene) var CellPrefab = null
export (PackedScene) var SniperPrefab = null

func _ready():
	for i in 11:
		for j in 11:
			#generate buttons
			var new_button = CellPrefab.instance()
			new_button.index = i;
			new_button.connect("cell_clicked", self, "_grid_pressed")
			add_child(new_button)
			#generate snipers
			if(i==0):
				var sniper = SniperPrefab.instance()
				sniper.set_team_red()
				new_button.add_child(sniper)

func _grid_pressed(buttonRef):
	print(buttonRef.index)
