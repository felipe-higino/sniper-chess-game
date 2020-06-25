extends Button

signal cell_clicked(ref)

var grid_position:Vector2 = Vector2(0,0)

func _on_Button_button_down():
	emit_signal("cell_clicked", self)
