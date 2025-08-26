extends Node

var lost: bool = false
var won: bool = false

func _physics_process(_delta: float) -> void:
	if lost:
		reset_level()

func reset_level():
	get_tree().reload_current_scene()
	lost = false
