extends Spatial

export (Array, AudioStream) var sounds = []

onready var sound = $PingSound
var count: int = 0
var is_up: bool = false

func _process(delta):
	
	$AnimationPlayer2.playback_speed = 1
	yield(get_tree().create_timer(22), "timeout")
	$AnimationPlayer2.playback_speed = 2
	yield(get_tree().create_timer(20), "timeout")
	$AnimationPlayer2.playback_speed = 3
func up() -> void:
	$AnimationPlayer.play("Pop")
	visible = true
	is_up = true


func down() -> void:
	$AnimationPlayer.play_backwards("Pop")
	visible = false
	is_up = false


func _on_Area_body_entered(body: Node) -> void:
	if body.is_in_group("Bullet") and is_up:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		down()
		Events.emit_signal("target_hit")
		get_tree().change_scene("res://Levels/Hard/GameOver.tscn")
