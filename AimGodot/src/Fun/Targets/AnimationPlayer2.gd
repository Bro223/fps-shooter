extends AnimationPlayer



func _ready():
	_play()


func _play() -> void:
	if Input.is_action_pressed("speed1"):
			$AnimationPlayer2.play("move")
