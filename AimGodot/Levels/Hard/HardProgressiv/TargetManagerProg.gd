extends Spatial

var previous: int = -1
var speed: int = 1

signal speedI(nr)
signal speedD(nr)


func _ready() -> void:
	Events.connect("target_hit", self, "_raise_target")
	_raise_target()
	emit_signal("speedD",1)
	emit_signal("speedI",1)
	yield(get_tree().create_timer(22), "timeout")
	emit_signal("speedD",2)
	emit_signal("speedI",2)
	yield(get_tree().create_timer(20), "timeout")
	emit_signal("speedD",3)
	emit_signal("speedI",3)

func _raise_target() -> void:
	var new_target = _choose_target()
	if new_target == previous:
		new_target = (new_target + 1) % get_child_count()
	previous = new_target
	get_child(new_target).up()

func _choose_target() -> int:
	return randi() % get_child_count()

