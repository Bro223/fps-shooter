extends Button

func _unhandled_key_input(event):
	var ev = InputEventKey.new()
	ev.scancode = event
	InputMap.erase_action("forward")
	InputMap.add_action("forward")
	InputMap.action_add_event("forward", ev)
