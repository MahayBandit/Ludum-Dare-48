extends Area2D

export var velocity: float = 500

func _process(delta):
	position.y -= velocity * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_GemPickup_body_entered(body):
	if body.is_rocket:
		pass
	else:
		body.points_change(100)
		queue_free()
