extends GridContainer

export (PackedScene) var CellPrefab = null

func _ready():
	for i in 11*11:
		var new_button = CellPrefab.instance()
		new_button.index = i;
		new_button.connect("cell_clicked", self, "_grid_pressed")
		add_child(new_button)

func _grid_pressed(buttonRef):
	print(buttonRef.index)
