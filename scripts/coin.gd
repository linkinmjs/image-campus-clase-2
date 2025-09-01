extends Area2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
var was_collected: bool = false

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if was_collected:
		return
	was_collected = true
	hide()
	audio_stream_player_2d.play()
	GameManager.add_score(1)
	audio_stream_player_2d.finished.connect(self.queue_free)
	
