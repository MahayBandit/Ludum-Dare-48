extends Control


onready var score_label = $Panel/Label
onready var timer = get_node("Timer")
var score_count = 0

func _ready():
	score_label.text = str(score_count)
	timer.start()
	
	#CharPlayer.connect("game_over", self, "game_over")

func _on_Timer_timeout():
	#print("timeout!")
	score_count += 10
	score_label.text = str(score_count)

func game_over():
	
	timer.autostart = false
	timer.stop()
	score_label.text = "GAME OVER!"

