extends Button

signal cell_clicked(ref)

var index:int = 0

func _on_Button_button_down():
	emit_signal("cell_clicked", self)
