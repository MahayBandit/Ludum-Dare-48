extends Node

export (PackedScene) var ObstacleA
export (PackedScene) var ObstacleB

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func _on_Main_spawn_obstacle(spawn_location):
	var roll = rng.randi_range(1, 2)
	var pickup
	
	if roll == 1:
		pickup = ObstacleA.instance()
		add_child(pickup)
	else:
		pickup = ObstacleB.instance()
		add_child(pickup)
		
	pickup.position = spawn_location.position
