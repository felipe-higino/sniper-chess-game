extends Button
class_name GridCell

signal cell_clicked(ref, is_pressed)

var grid_position:Vector2 = Vector2(0,0)

func _on_Button_toggled(button_pressed):
	emit_signal("cell_clicked", self, button_pressed)
