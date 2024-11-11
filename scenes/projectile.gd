extends Area2D
class_name Projectile

var velocity: Vector2 = Vector2.ZERO
@export var speed: float = 200
const MAX_COORDINATES: int = 10000
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func setVelocity(new_velocity: Vector2) -> void:
	velocity = new_velocity

func _physics_process(delta: float) -> void:
	position += velocity * speed * delta
	
	if position.x > MAX_COORDINATES || position.x < -MAX_COORDINATES || position.y > MAX_COORDINATES || position.y < -MAX_COORDINATES:
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("destroyable"):
		body.queue_free()
		queue_free()
	
	pass # Replace with function body.
