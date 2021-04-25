extends Node2D

signal spawn_obstacle(spawn_location)
signal spawn_enemy(spawn_location)
signal spawn_pickup(spawn_location)

export (PackedScene) var spike_scene

var rng = RandomNumberGenerator.new()

func _ready():
	randomize()

func _on_SpikeTimer_timeout():
	#Set Random location for spikes on left and right
	var location_flag = rng.randi_range(0,1)
	var spike_location = $SpikePath/SpikePathLocation
	spike_location.unit_offset = location_flag
	
	var spike = spike_scene.instance()
	add_child(spike)
	
	spike.position = spike_location.position
	
	if location_flag:
		spike.rotation += PI

func _on_SpawnTimer_timeout():
	
	#Set random spawn location on the SpawnPath
	var spawn_location = $SpawnPath/SpawnPathLocation
	spawn_location.unit_offset = randf()
	
	#Roll spawn category
	var spawn_roll = rng.randi_range(1, 100)
	_spawn_category(spawn_roll, spawn_location)
	
func _spawn_category(var spawn_roll, var spawn_location):
	
	#Choose category of what to spawn
	if spawn_roll <= 50:
		emit_signal("spawn_obstacle", spawn_location)
	elif spawn_roll <= 80:
		emit_signal("spawn_enemy", spawn_location)
	else:
		emit_signal("spawn_pickup", spawn_location)
