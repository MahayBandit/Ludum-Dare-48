extends Sprite

export var speed = 250
const MAX_DISTANCE = 600.0
var state: bool = true
var start_position = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	 start_position = get_position()

func _process(delta):
	var velocity = Vector2.ZERO
	if state:
		velocity = Vector2.RIGHT * speed
	else:
		velocity = Vector2.LEFT * speed
	position += velocity * delta
	if position.x >= MAX_DISTANCE:
		state = false
	elif position.x <= start_position.x:
		state = true
