extends KinematicBody2D

export var speed:= 0
export var falling_modifier = 1.0

export var health = 0

func _ready():
	print("fuck this shit")

func _physics_process(delta: float) -> void:
	
	var movement: = Vector2(1,1)
	
	movement = movement*speed
	
	var horizontl:= Vector2(Input.get_action_strength("Player_move_right") - Input.get_action_strength("Player_move_left"), 1.0)
	
	var verticl := Vector2(1.0 , Input.get_action_strength("Player_move_down") - Input.get_action_strength("Player_move_up"))
	
	
	
	if Input.get_action_strength("Player_move_faster"):
		falling_modifier = 2.0
	else:
		falling_modifier = 0.5
	
	movement = movement * horizontl
	movement = movement * verticl * falling_modifier
	
	movement.normalized()
	
	move_and_slide(movement)


func take_dmg():
	print("fuck this shit")
	
	health = health - 1
	if health <= 0:
		visible = not visible
	
	
