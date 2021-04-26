extends KinematicBody2D

export var velocity = 500
var is_rocket = true
var is_wall = false

func _process(delta):
	position.y += velocity * delta

func destroy():
	queue_free()

func _on_Timer_timeout():
	queue_free()
