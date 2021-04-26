extends KinematicBody2D

export (PackedScene) var rocket_scene

export var speed = 500
export var max_health = 3
var health = 0
var ammo = 3
var points = 0

signal on_health_changed(amount)
signal game_over()
signal make_immortal()
signal ammo_change(amount)

var immortal = false
var rocket_flag = true
var imortality_timer
var rocket_timer

var is_rocket = false
var is_wall = false

func _ready():
	imortality_timer = get_node("ImmortalityTimer")
	imortality_timer.connect("timeout", self, "on_imortality_timer_timeout")
	
	rocket_timer = get_node("RocketTimer")
	rocket_timer.connect("timeout", self, "on_rocket_timer_timeout")
	rocket_timer.set_one_shot(true)
	
	health = max_health
	
	emit_signal("on_health_changed", health)
	emit_signal("ammo_change", ammo)

func _process(_delta):
	var movement = Vector2.ZERO
	
	if Input.is_action_pressed("ui_left"):
		movement.x = -1
	if Input.is_action_pressed("ui_right"):
		movement.x = 1
	if Input.is_action_just_pressed("ui_accept"):
		if rocket_flag:
			shoot_rocket()
	
	move_and_slide(movement * speed)

#Health managment
func take_dmg(amount):
	if not immortal:
		health_change(-amount)

	emit_signal("on_health_changed", health)
	immortality()

func immortality(duration=3):
	if not immortal:
		immortal = true
		print ("immortality")
		emit_signal("make_immortal")
	
		imortality_timer.set_wait_time(duration)
		imortality_timer.start()
	
func on_imortality_timer_timeout():
	immortal = false
	emit_signal("make_immortal")
	
func health_change(amount):
	health += amount
	
	if health > max_health:
		health = max_health
	
	print("Health changed: ", health)
		
	emit_signal("on_health_changed", health)
		
	if health <= 0:
		emit_signal("game_over")

#Ammo managment
func ammo_change(amount):
	ammo += amount
	emit_signal("ammo_change", ammo)

func shoot_rocket():
	if ammo != 0:
		rocket_timer.start()
		rocket_timer.set_wait_time(1)
		var rocket = rocket_scene.instance()
		get_node("/root/Main").add_child(rocket)
		rocket.position = position + Vector2(0, 150)
	
		ammo -= 1
		rocket_flag = false
		emit_signal("ammo_change", ammo)

func on_rocket_timer_timeout():
	rocket_flag = true

#Points managmet
func points_change(amount):
	points += amount
	print("Oto twoje punkty byku: ", points)

