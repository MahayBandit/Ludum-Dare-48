extends TextureRect
onready var points = $MainBox/Scoreboard/Score


# Called when the node enters the scene tree for the first time.
func _ready():
	var final_points = GlobalVars.score
	points.text = str(final_points)
	
func _on_Retry_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")
	pass # Replace with function body.


func _on_Exit_pressed():
	get_tree().quit()
	pass # Replace with function body.

