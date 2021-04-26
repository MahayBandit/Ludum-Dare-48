extends Label

var dupa

func _ready():
	pass 
	text = "dupa"
	
	dupa = get_node("res://scenes/Char_Player.tscn")
	dupa.connect("on_health_change", self, "health")
	
	print(dupa)
	
func health(ammount):
	print("label - wartosc")
	text = ammount
