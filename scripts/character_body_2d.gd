class_name player

extends CharacterBody2D

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -500.0

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	velocity.x = SPEED
	
	# Check win condition
	if GameManager.won and is_on_floor():
		velocity.x = 0
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and !GameManager.won:
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = 0
		
	animate_player()
	move_and_slide()
	
func animate_player():
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
