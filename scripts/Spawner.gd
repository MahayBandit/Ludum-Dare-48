extends Area2D

signal spawn_obstacle(spawn_pos)
signal spawn_enemy(spawn_pos)
signal spawn_pickup(spawn_pos)

export var speed = 250
const MAX_DISTANCE = 700.0
var state: bool = true
var start_position = 0
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	start_position = get_position()
	var timer = get_node("SpawnTimer")
	timer.connect("timeout", self, "_on_Timer_timeout")

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
	
func _on_Timer_timeout():	
# Choose a spawn category
	var spawn_category = rng.randi_range(1, 100)
	if spawn_category <= 50:
		emit_signal("spawn_obstacle", position)
	elif spawn_category <= 80:
		emit_signal("spawn_enemy", position)
	else:
		emit_signal("spawn_pickup", position)
