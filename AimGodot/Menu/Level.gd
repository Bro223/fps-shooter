extends Control

func _ready() -> void:
	OS.window_fullscreen = true
	
func _on_Easy_pressed():
	get_tree().change_scene("res://Levels/Hard/HardEasy/HardEasy.tscn")


func _on_Custom_pressed():
	get_tree().change_scene("res://Levels/Hard/Hard.tscn")


func _on_Medium_pressed():
	get_tree().change_scene("res://Levels/Hard/HardMedium/HardMedium.tscn")


func _on_Hard_pressed():
	get_tree().change_scene("res://Levels/Hard/HardHard/HardHard.tscn")


func _on_Prog_pressed():
	get_tree().change_scene("res://Levels/Hard/HardProgressiv/HardProg.tscn")
