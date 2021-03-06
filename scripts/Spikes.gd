extends Area2D

export var velocity: float = 500

func _process(delta):
	position.y -= velocity * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
func _on_Spike_body_entered(body):
	body.take_dmg(1)
