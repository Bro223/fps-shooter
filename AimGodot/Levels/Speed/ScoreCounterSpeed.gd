extends Viewport

var score: int = 0
var shoots: float = 0
var seconds: int = 34
var scorehistory: int = 0
var shoothistory: int = 0

signal scr(nr)
signal acr(nr2,nr3)
signal time(nr3)

func _ready() -> void:
	Events.connect("target_hit", self, "_on_hit")
	Events.connect("gun_fired", self, "_on_fire")
	_update_board()

func _process(delta):
	if Input.is_action_just_pressed("start"):
		_on_Timerdsa_timeout()
	if seconds == 0:
		$Timerdsa.stop()
		_update_board()
		scorehistory = score
		shoothistory = shoots
		emit_signal("scr",scorehistory)
		emit_signal("acr",score,shoots)
		emit_signal("time",seconds)
		if Input.is_action_just_pressed("Restart"):
			seconds = 34
			shoots = 0
			score = 0
			emit_signal("time",seconds)

func _on_hit() -> void:
	score += 1
	_update_board()

func _on_fire() -> void:
	shoots += 1
	yield(get_tree().create_timer(0.3), "timeout")
	_update_board()

func _update_board() -> void:
	$Score/HBoxContainer/Score/Count.text = str(score)
	
	var acc = score / shoots if shoots else 0.0
	$Score/HBoxContainer/Accuracy/Count.text = str("%d" % [acc * 100], "%")
	render_target_update_mode = Viewport.UPDATE_ONCE


func _on_Timerdsa_timeout():
	seconds -= 1
	$Timerdsa.start()
