extends Area2D

export var velocity: float = 500
export var speed: float = 300
var flag

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	flag = rng.randi_range(0,1)
	print("Flaga ", flag)

func _process(delta):
	position.y -= velocity * delta
	
	var movement = Vector2.ZERO
	
	if flag:
		movement.x = -1
	else:
		movement.x = 1
	
	position += movement * speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Area2D_body_entered(body):
	if body.is_rocket:
		body.destroy()
		queue_free()
	elif body.is_wall:
		if flag:
			flag = 0
		else:
			flag = 1
	else:	
		body.take_dmg(1)
		queue_free()
