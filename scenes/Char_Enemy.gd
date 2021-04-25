extends KinematicBody2D

func take_dmg():
	print("")

func _on_PlayerDetector_body_entered(body):
	body.take_dmg()
	
