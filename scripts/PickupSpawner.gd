extends Node

export (PackedScene) var PickupA
export (PackedScene) var PickupB
export (PackedScene) var PickupC

var rng = RandomNumberGenerator.new()

func _on_Main_spawn_pickup(spawn_location):
	var roll = rng.randi_range(1, 3)
	var pickup
	
	if roll == 1:
		pickup = PickupA.instance()
		add_child(pickup)
		print("Spawn A")
	elif roll == 2:
		pickup = PickupB.instance()
		add_child(pickup)
		print("Spawn B")
	else:
		pickup = PickupC.instance()
		add_child(pickup)
		print("Spawn C")
		
	pickup.position = spawn_location.position
	
