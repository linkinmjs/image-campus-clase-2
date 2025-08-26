class_name player

extends CharacterBody2D

# TODO:
# Los enemigos spawneen random

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -500.0

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = 0
	
	velocity.x = SPEED
	

	if GameManager.won:
		velocity = Vector2(0,0)

	move_and_slide()
	
func _process(delta: float) -> void:
	
	if GameManager.won:
		sprite_2d.play("idle")
		pass
	else:
		if is_on_floor():
			sprite_2d.play("running")
		else:
			if velocity.y < 0:
				sprite_2d.play("jumping")
			elif velocity.y > 0:
				sprite_2d.play("falling")
