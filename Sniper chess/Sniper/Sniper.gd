extends ColorRect

export (Color) var RED = null
export (Color) var BLU = null

const ANGLES = {
	"TOP": 0.0,
	"BOTTOM": 180.0,
	"RIGHT": 90.0,
	"LEFT": -90.0
}

func _set_sniper_angle(value):
	set_rotation_degrees(value)

#---------------------------------- API
func face_top():
	_set_sniper_angle(ANGLES.TOP)

func face_bot():
	_set_sniper_angle(ANGLES.BOTTOM)

func face_left():
	_set_sniper_angle(ANGLES.LEFT)

func face_right():
	_set_sniper_angle(ANGLES.RIGHT)

func set_team_blue():
	color = BLU

func set_team_red():
	color = RED
