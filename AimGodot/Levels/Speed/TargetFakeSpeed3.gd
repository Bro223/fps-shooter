extends Spatial

var previous: int = -1
var speed: int = 2
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
		_on_Timer_timeout()
		while true:
			yield(get_tree().create_timer(10), "timeout")
			visible = true
			yield(get_tree().create_timer(1), "timeout")
			visible = false
			yield(get_tree().create_timer(10), "timeout")
			visible = true
			yield(get_tree().create_timer(1), "timeout")
			visible = false
			break


func _raise_target() -> void:
	var new_target = _choose_target()
	if new_target == previous:
		new_target = (new_target + 1) % get_child_count()
	previous = new_target
	get_child(new_target).up()

func _choose_target() -> int:
	return randi() % get_child_count()

func _on_Timer_timeout():
	seconds -=1
	seconds2 -=1
	
