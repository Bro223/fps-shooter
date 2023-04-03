extends Control



func _on_Menu_pressed():
	get_tree().change_scene("res://Menu/Menu.tscn")


func _on_Quit_pressed():
	get_tree().quit()
	
