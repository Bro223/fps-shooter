extends Control

func _ready() -> void:
	OS.window_fullscreen = true

func _on_Fun_pressed():
	get_tree().change_scene("res://Levels/Fun/Fun.tscn")


func _on_Speed_pressed():
	get_tree().change_scene("res://Levels/Speed/Speed.tscn")


func _on_Hard_pressed():
	get_tree().change_scene("res://Menu/Level.tscn")


func _on_Quit_pressed():
	get_tree().quit()
