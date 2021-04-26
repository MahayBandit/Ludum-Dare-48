extends KinematicBody2D

func take_dmg(ammount):
	pass

func _on_PlayerDetector_body_entered(body):
	body.take_dmg(-1)
	
