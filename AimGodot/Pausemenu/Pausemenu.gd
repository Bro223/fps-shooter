extends Control

var is_paused = false setget set_is_paused
onready var sens = $CenterContainer/Node2D/HSlider

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused
	if is_paused == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if is_paused == false:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused

func _on_Resume_pressed():
	self.is_paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_Quit_pressed():
	get_tree().quit()


func _on_Main_Menu_pressed():
	get_tree().change_scene("res://Menu/Menu.tscn")
	self.is_paused = false


func _on_Settings_pressed():
	get_tree().change_scene("res://Pausemenu/SettingsMenu.tscn")


