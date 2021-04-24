extends Sprite

var velocity: float = 10.0
var g_texture_height: float = 0
var start_position: float = 0

func _ready():
	g_texture_height = texture.get_size().y * scale.y
	start_position = position.y
	
func _process(_delta):
	position.y -= velocity
	_attempt_reposition()
	
func _attempt_reposition():
	if position.y < -g_texture_height/2 + 100:
		position.y = start_position
