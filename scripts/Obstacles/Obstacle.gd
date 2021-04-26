extends Area2D

export var velocity: float = 500

func _process(delta):
	position.y -= velocity * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_BricksObstacle_body_entered(body):
	if body.is_rocket:
		body.destroy()
		queue_free()
	else:
		body.take_dmg(1)
		queue_free()

func _on_PlanksObstacle_body_shape_entered(body_id, body, body_shape, local_shape):
	if body.is_rocket:
		body.destroy()
		queue_free()
	else:
		body.take_dmg(1)
		queue_free()
