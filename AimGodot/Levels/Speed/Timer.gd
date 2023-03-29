extends Viewport

var seconds: int = 3
var seconds2: int = 34

func _process(delta):
	if Input.is_action_just_pressed("start"):
		_on_Timers_timeout()
	if seconds > -1:
		$Timer/VBoxContainer/Timer/.text = str(seconds)
		if seconds == 0:
			$Timer/VBoxContainer/Timer/.text = "Start"
	else:
		if seconds2 > -1:
			$Timer/VBoxContainer/Timer/.text = str(seconds2)
		else:
			$Timers.stop()
			if Input.is_action_just_pressed("Restart"):
				seconds2 = 34
				seconds = 3
				$Timer/VBoxContainer/Timer/.text = str(seconds)

func _on_Timers_timeout():
	seconds -= 1
	seconds2 -= 1
	$Timers.start()
