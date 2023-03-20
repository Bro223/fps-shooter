extends Sprite3D

var seconds: int = 34

func _process(delta):
	if Input.is_action_just_pressed("start"):
		_on_Timer_timeout()
	if seconds == 0:
		$Timer.stop()
		visible = true


func _on_Timer_timeout():
	seconds -= 1
	$Timer.start()
