extends Node

export (PackedScene) var PickupA
export (PackedScene) var PickupB
export (PackedScene) var PickupC
export (PackedScene) var PickupD

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func _on_Main_spawn_pickup(spawn_location):
	var roll = rng.randi_range(1, 4)
	var pickup
	
	if roll == 1:
		pickup = PickupA.instance()
		add_child(pickup)
	elif roll == 2:
		pickup = PickupB.instance()
		add_child(pickup)
	elif roll == 3:
		pickup = PickupC.instance()
		add_child(pickup)
	else:
		pickup = PickupD.instance()
		add_child(pickup)
		
	pickup.position = spawn_location.position
	
