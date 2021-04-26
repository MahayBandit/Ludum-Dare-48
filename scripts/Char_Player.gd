extends KinematicBody2D



export var speed:= 0
export var falling_modifier = 1.0

export var max_health = 0
var health = 0


var immortal = false


func _ready():
	
	health = max_health
	print("poczatkowe hp: ", health)
	print("3... 2... 1...")
	print("FALL!")


func _physics_process(delta: float) -> void:
	
	var movement: = Vector2(1,1)
	
	movement = movement*speed
	
	var horizontl:= Vector2(Input.get_action_strength("Player_move_right") 
	- Input.get_action_strength("Player_move_left"), 1.0)
	
	var verticl := Vector2(1.0 , Input.get_action_strength("Player_move_down") 
	- Input.get_action_strength("Player_move_up"))
	
	
	
	if Input.get_action_strength("Player_move_faster"):
		falling_modifier = 2.0
	else:
		falling_modifier = 0.5
	
	movement = movement * horizontl
	#movement = movement * verticl * falling_modifier 
	movement. y = 0
	
	movement.normalized()
	
	move_and_slide(movement)

	

func take_dmg(ammount):
	print("collision occured UwU")
	
	
	if not immortal:
		health_change(ammount)
		immortality()


func immortality(duration=3):
	immortal = true
	print ("immortality")
	
	var timer = get_node("ImmortalityTimer")
	
	timer.set_wait_time(duration)
	
	
	timer.connect("timeout", self, "on_timer_timeout")
	timer.set_one_shot(true)
	timer.start()
	
	
func on_timer_timeout():
	immortal = false
	
	
	
func health_change(ammount):
	
		health = health + ammount
		
		if health > max_health:
			health = max_health
		
		print("Health changed: ", health)
		
		#if health <= 0:
			#visible = false
