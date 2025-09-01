extends Node

var lost: bool = false
var won: bool = false
var total_score: int = 0

func _physics_process(_delta: float) -> void:
	if lost:
		reset_level()

func reset_level():
	get_tree().reload_current_scene()
	lost = false

func add_score(score: int) -> void:
	total_score += score
