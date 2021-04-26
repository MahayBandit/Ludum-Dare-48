extends Control

onready var ammo_label = $AmmoDisplay

func _on_PlayerBody_ammo_change(amount):
	ammo_label.text = "x " + str(amount)
	pass
