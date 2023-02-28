extends Control

func _ready() -> void:
	OS.window_fullscreen = true

func _on_Fun_pressed():
	get_tree().change_scene("res://Levels/Fun/Fun.tscn")


func _on_Speed_pressed():
	get_tree().change_scene("res://Fun/Main2.tscn")


func _on_Hard_pressed():
	get_tree().change_scene("res://Levels/Hard/Hard.tscn")
