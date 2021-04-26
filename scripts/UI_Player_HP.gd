extends Control

onready var label = $Panel/Label

onready var Hearts_col  = $Panel/Heart_col
onready var Hearts_blue = $Panel/Hearts_blue

func _ready():
	Hearts_col.rect_size.x = 384.0
	Hearts_blue.rect_size.x = 384.0
	Hearts_blue.visible = not visible

func _on_PlayerBody_on_health_changed(ammount):
	print("dupa")
	Hearts_col.rect_size.x = ammount * 128.0 
	Hearts_blue.rect_size.x = ammount * 128.0
	
	
	if ammount == 0:
		Hearts_col.visible = false


func _on_PlayerBody_make_immortal():
	Hearts_blue.visible = not Hearts_blue.visible
