extends Button

signal cell_clicked(ref)

func _on_Button_button_down():
	emit_signal("cell_clicked", self)
