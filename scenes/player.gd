extends CharacterBody2D

@export var speed: float = 100.0

func _physics_process(delta: float) -> void:
	playerMovement(delta)

func playerMovement(delta: float) :
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("player_down"):
		velocity = Vector2.DOWN
	elif Input.is_action_pressed("player_up"):
		velocity = Vector2.UP 
	
	if Input.is_action_pressed("player_left"):
		velocity = Vector2.LEFT
	elif Input.is_action_pressed("player_right"):
		velocity = Vector2.RIGHT
	
	velocity = velocity.normalized()
	velocity = velocity * speed * delta
	position += velocity
	move_and_slide()
