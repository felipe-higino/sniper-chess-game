extends Button
class_name GridCell

signal cell_clicked(ref, is_pressed)

var grid_position:Vector2 = Vector2(0,0)

func _on_Button_toggled(button_pressed):
	if Input.is_action_just_released("delete_sniper"):
		pressed=false
		var child = get_child(0)
		if(child):
			child.queue_free()
		return
	emit_signal("cell_clicked", self, button_pressed)
