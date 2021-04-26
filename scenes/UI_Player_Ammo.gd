extends Control

onready var ammo_label = $AmmoDisplay




func _on_PlayerBody_ammo_change(ammount):
	ammo_label.text = "x " + str(ammount)
