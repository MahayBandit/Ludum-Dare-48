extends Node2D

#signal speed_up_on(time_left)
signal spawn_pickup(spawn_location)

export (PackedScene) var spike_scene
var rng = RandomNumberGenerator.new()
export var speed_duration = 5
var timer
var speedup: bool = false

func _ready():
	randomize()
	
	timer = Timer.new()
	timer.set_wait_time(speed_duration)
	timer.set_one_shot(true)
	add_child(timer)
	timer.connect("timeout", self, "_on_SpeedTimer_timeout")

func _on_SpikeTimer_timeout():
	#Set Random location for spikes on left and right
	var location_flag = rng.randi_range(0,1)
	var spike_location = $SpikePath/SpikePathLocation
	spike_location.unit_offset = location_flag
	
	var spike = spike_scene.instance()
	add_child(spike)
	
	spike.position = spike_location.position
	
#	if speedup:
#		emit_signal("speed_up_on", timer.get_time_left())
	
	if location_flag:
		spike.rotation += PI

func _on_SpawnTimer_timeout():
	var spawn_location = $SpawnPath/SpawnPathLocation
	spawn_location.unit_offset = randf()
	
	#Roll spawn category
	var spawn_roll = rng.randi_range(1, 100)
	
	#Choose category of what to spawn
#	if spawn_roll <= 50:
#		pass
#		_spawn_obstacle()
#	elif spawn_roll <= 80:
#		pass
#		_spawn_enemy()
#	else:
	emit_signal("spawn_pickup", spawn_location)
	
func _on_SpeedUp():
	speedup = true

func _on_SpeedTimer_timeout():
	speedup = false
