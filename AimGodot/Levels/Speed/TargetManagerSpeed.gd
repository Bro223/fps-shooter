extends Spatial

var previous: int = -1
var speed: int = 1
var seconds: int = 4
var seconds2: int = 34
signal speedI(nr)
signal speedD(nr)


func _ready() -> void:
	Events.connect("target_hit", self, "_raise_target")
	_raise_target()
	emit_signal("speedD",speed)
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("start"):
		_on_Timers_timeout()
	if seconds == 0:
		visible = true
	if seconds2 == 0:
		visible = false
	if Input.is_action_just_pressed("speed1"):
		speed += 1
		emit_signal("speedI",speed)
	if Input.is_action_just_pressed("speed2"):
		speed -= 1
		emit_signal("speedD",speed)
		
func _raise_target() -> void:
	var new_target = _choose_target()
	if new_target == previous:
		new_target = (new_target + 1) % get_child_count()
	previous = new_target
	get_child(new_target).up()

func _choose_target() -> int:
	return randi() % get_child_count()

func _on_Timers_timeout():
	seconds -= 1
	seconds2 -= 1