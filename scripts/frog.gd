extends Path2D

## TODO: mejorar este código
@onready var path_follow_2d: PathFollow2D = $PathFollow2D
var move_speed := 100
var direction: float = 1.0

func _process(delta: float) -> void:
	path_follow_2d.progress += direction * move_speed * delta
	
	if(path_follow_2d.progress_ratio >= 1.0 || path_follow_2d.progress_ratio <= 0.0):
		direction *= -1

func _on_area_2d_body_entered(body: Node2D) -> void:
	GameManager.lost = true
