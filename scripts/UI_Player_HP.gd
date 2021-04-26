extends Control

onready var Hearts_col  = $Hearts_col
onready var Hearts_blue = $Hearts_blue

func _ready():
	Hearts_col.rect_size.x = 384.0
	Hearts_blue.rect_size.x = 384.0
	Hearts_blue.visible = not visible

func _on_PlayerBody_on_health_changed(amount):
	print(amount)
	Hearts_col.rect_size.x = amount * 128.0 
	Hearts_blue.rect_size.x = amount * 128.0
	
	if amount == 0:
		Hearts_col.visible = false

func _on_PlayerBody_make_immortal():
	Hearts_blue.visible = not Hearts_blue.visible

func _on_PlayerBody_game_over():
	pass # Replace with function body.
