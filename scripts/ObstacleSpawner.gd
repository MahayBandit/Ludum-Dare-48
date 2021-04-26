extends Node

export (PackedScene) var ObstacleA
export (PackedScene) var ObstacleB

var rng = RandomNumberGenerator.new()

func _on_Main_spawn_obstacle(spawn_location):
	var roll = rng.randi_range(1, 2)
	var pickup
	
	if roll == 1:
		pickup = ObstacleA.instance()
		add_child(pickup)
		print("Spawned: Brick Obstacle")
	else:
		pickup = ObstacleB.instance()
		add_child(pickup)
		print("Spawned: Plank Obstacle")
		
	pickup.position = spawn_location.position
