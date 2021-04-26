extends Node

export (PackedScene) var EnemyA
export (PackedScene) var EnemyB

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func _on_Main_spawn_enemy(spawn_location):
	var roll = rng.randi_range(1, 2)
	var enemy
	
	if roll == 1:
		enemy = EnemyA.instance()
		add_child(enemy)
	else:
		enemy = EnemyB.instance()
		add_child(enemy)
		
	enemy.position = spawn_location.position
