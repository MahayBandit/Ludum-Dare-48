extends StaticBody2D

export var default_velocity: float = 500
export var speed_duration = 5
var height: float = 1800
var start_position: float = 0
var velocity = default_velocity
var timer

func _ready():
	#Connect timer
	timer = Timer.new()
	timer.set_wait_time(5)
	timer.set_one_shot(true)
	add_child(timer)
	timer.connect("timeout", self, "_on_timer_timeout")

	start_position = position.y
	
func _process(delta):
	position.y -= velocity * delta
	_attempt_reposition()
	
func _attempt_reposition():
	if position.y < -height/2+100:
		position.y = start_position

#Change speed on signal
func _on_SpeedUp():
	velocity = velocity * 2
	timer.start()

#Restore default speed
func _on_timer_timeout():
	velocity = default_velocity

func take_dmg(ammount):
	print("")
