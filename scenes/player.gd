extends CharacterBody2D

@export var speed: float = 100.0

func _physics_process(delta: float) -> void:
	playerMovement(delta)

func playerMovement(delta: float) :
	velocity = Vector2.ZERO
	var anim = $AnimatedSprite2D
	if Input.is_action_pressed("player_down"):
		velocity = Vector2.DOWN
	elif Input.is_action_pressed("player_up"):
		velocity = Vector2.UP 
		anim.play("default_walk")
	if Input.is_action_pressed("player_left"):
		velocity = Vector2.LEFT
		anim.play("default_walk")
	elif Input.is_action_pressed("player_right"):
		velocity = Vector2.RIGHT
		anim.play("default_walk")
	
	velocity = velocity.normalized()
	velocity = velocity * speed * delta
	
	if (velocity == Vector2.ZERO):
		anim.play("default_idle")
	
	position += velocity
	move_and_slide()
