extends KinematicBody

export var sensitivity: float = 0.9
export var speed: float = 20
onready var camera: Camera = $Camera

signal sens(nr)

var jump_speed = 15

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_viewport().warp_mouse(get_viewport().size * 0.5)
	emit_signal("sens",sensitivity)
	


func _process(delta: float) -> void:
	# ROTATE
	var mouse_speed = _get_mouse_speed()
	rotate_y(mouse_speed.x * sensitivity * delta)
	camera.rotate_x(mouse_speed.y * sensitivity * delta * 0.5)
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, -90, 90)
	get_viewport().warp_mouse(get_viewport().size * 0.5)
	
	# MOVE
	var velocity = Vector3()
	velocity += transform.basis.z * (Input.get_action_strength("back") - Input.get_action_strength("forward"))
	velocity += transform.basis.x * (Input.get_action_strength("right") - Input.get_action_strength("left"))
	move_and_slide(velocity * speed)
	
	if Input.is_action_just_pressed("ui_page_up"):
		sensitivity += 0.1
		emit_signal("sens",sensitivity)
	if Input.is_action_just_pressed("ui_page_down"):
		sensitivity -= 0.1
		emit_signal("sens",sensitivity)
		
func _get_mouse_speed() -> Vector2:
	return get_viewport().size * 0.5 - get_viewport().get_mouse_position()
	
	
