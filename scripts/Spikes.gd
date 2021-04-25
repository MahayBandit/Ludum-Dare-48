extends StaticBody2D

export var default_velocity: float = 5
export var speed_duration = 5
var velocity = default_velocity
var speedup: bool
var timer

func _ready():
	#Connect timer
	timer = Timer.new()
	timer.set_wait_time(5)
	timer.set_one_shot(true)
	add_child(timer)
	timer.connect("timeout", self, "_on_timer_timeout")
	
	#Connect SpeedUp
	var button = get_node("/root/Main/Button")
	button.connect("pressed", self, "_on_SpeedUp")
	
func _process(_delta):
	position.y -= velocity
	
#Change speed on signal
func _on_SpeedUp():
	velocity = velocity * 2
	timer.start()

#Restore default speed
func _on_timer_timeout():
	velocity = default_velocity
