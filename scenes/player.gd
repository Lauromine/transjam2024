extends CharacterBody2D
class_name Player

@export var speed: float = 100.0
var current_hat_state:HAT_STATE = HAT_STATE.DEFAULT
var hats:Array[HAT_STATE] = []

enum STATES {
	STAY,
	CONTROLLED
}

enum HAT_STATE {
	DEFAULT,
	MAGICIAN,
	DEMON,
	TIMMY
}

var state: STATES = STATES.CONTROLLED

func _init() -> void:
	state = STATES.CONTROLLED

func _physics_process(delta: float) -> void:
	if state == STATES.CONTROLLED:
		playerMovement(delta)
	elif state == STATES.STAY:
		stay(delta)
		
	if Input.is_action_pressed("use_power"):
		usePower()
		
	if Input.is_action_just_pressed("change_hat"):
		changeHat()

func playerMovement(delta: float) :
	velocity = Vector2.ZERO
	var anim = $AnimatedSprite2D
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
	
	if (velocity == Vector2.ZERO):
		anim.play(HAT_STATE.keys()[current_hat_state] + "_IDLE")
	else:
		anim.play(HAT_STATE.keys()[current_hat_state] + "_WALK")
	
	position += velocity
	move_and_slide()

func usePower():
	if current_hat_state == HAT_STATE.MAGICIAN:
		doMagicianPower()
	pass

func stay(delta):
	pass

func doMagicianPower(): 
	pass
	
func changeHat():
	if len(hats) == 0:
		return
		
	var hatIndex = hats.find(current_hat_state)
	hatIndex += 1
	if hatIndex >= len(hats):
		hatIndex = 0
	
	current_hat_state = hats[hatIndex]
	

func setModeControlled():
	state = STATES.CONTROLLED
	$Camera2D.make_current()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Hat :
		var pickedup_hat = area as Hat
		hats.append(HAT_STATE[pickedup_hat.hat_type])
		current_hat_state = HAT_STATE[pickedup_hat.hat_type]
		area.queue_free()
	
	print(len(hats))
