extends StaticBody2D

export var velocity: float = 500
var height: float = 1800
var start_position: float = 0

var is_rocket = false
var is_wall = true

func _ready():
	start_position = position.y
	
func _process(delta):
	position.y -= velocity * delta
	_attempt_reposition()
	
func _attempt_reposition():
	if position.y < -height/2+101:
		position.y = start_position

func take_dmg(_amount):
	pass
	
func health_change(_dupa):
	pass
