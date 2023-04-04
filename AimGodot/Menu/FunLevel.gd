extends Control



func _on_Easy_pressed():
	get_tree().change_scene("res://Levels/Fun/FunEasy/FunEasy.tscn")


func _on_Hard_pressed():
	get_tree().change_scene("res://Levels/Fun/Fun.tscn")
