extends Spatial

export (Array, AudioStream) var sounds = []

onready var sounde = $PingSound
var count: int = 0
var is_up: bool = false


func up() -> void:
	$AnimationPlayer.play("Pop")
	is_up = true


func down() -> void:
	$AnimationPlayer.play_backwards("Pop")
	is_up = false


func _on_Area_body_entered(body: Node) -> void:
	if body.is_in_group("Bullet") and is_up:
		down()
		Events.emit_signal("target_hit")
