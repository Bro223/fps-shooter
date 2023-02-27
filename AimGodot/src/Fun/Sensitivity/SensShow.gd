extends Viewport

func _on_Player_sens(nr):
	$Sens/HBoxContainer/Sens/Count.text = str(nr)
