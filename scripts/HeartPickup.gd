extends KinematicBody2D

func health_change(ammount):
	print("")

func _on_PlayerDetector_body_entered(body):
	body.health_change(1)
	print("heart picked up <3")
	
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
