extends Control


onready var score_label = $ScoreDisplay
onready var timer = get_node("Timer")
var score_count = 0

func _ready():
	score_label.text = str(score_count)
	timer.start()
	
	#CharPlayer.connect("game_over", self, "game_over")

func _on_Timer_timeout():
	#print("timeout!")
	score_count += 1
	score_label.text = "Score: " + str(score_count)

func game_over():
	
	timer.autostart = false
	timer.stop()
	score_label.text = "GAME OVER! " + str(score_count) 

func _on_PlayerBody_game_over():
	game_over()
