extends Area2D

export var default_velocity: float = 500
export var speed_duration = 5
var velocity = default_velocity
var timer

func _ready():
	#Connect timer
	timer = Timer.new()
	timer.set_wait_time(speed_duration)
	timer.set_one_shot(true)
	add_child(timer)
	timer.connect("timeout", self, "_on_timer_timeout")
	
	#Connect SpeedUp
	var button = get_node("/root/Main/Button")
	button.connect("pressed", self, "_on_SpeedUp")
	#----zakomentowałem button.connect do testowanie ~Luna
	
	
	
	#Check if speed up is on
#	var main = get_node("/root/Main")
#	main.connect("speed_up_on", self, "_on_speed_up_on")
	
func _process(delta):
	position.y -= velocity * delta
	
#Change speed on signal
func _on_SpeedUp():
	velocity = velocity * 2
	timer.start()

#Restore default speed
func _on_timer_timeout():
	velocity = default_velocity

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func take_dmg(ammount):
	pass

func _on_Area2D_body_entered(body):
	body.take_dmg(-1)
