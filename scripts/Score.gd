extends Control

signal final_score(score_count)

onready var score_label = $ScoreDisplay
onready var timer = get_node("Timer")
var score_count

func _ready():
	print(get_path())
	score_count = 0
	score_label.text = str(score_count)
	timer.start()
	
	GlobalVars.score = 0
	
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
	GlobalVars.score = score_count
	emit_signal("final_score", score_count)
	game_over()

func _on_PlayerBody_add_points(amount):
	score_count += amount
	score_label.text = "Score: " + str(score_count)
