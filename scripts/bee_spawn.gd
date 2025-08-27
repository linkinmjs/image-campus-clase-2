extends Node2D

func _ready() -> void:
	spawn_bee()

func spawn_bee():
	var bee_scene = preload("res://scenes/bee.tscn")
	var bee = bee_scene.instantiate()
	bee.position.y = randf_range(-20, -220)
	add_child(bee)
	
