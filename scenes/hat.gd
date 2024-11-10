extends Area2D
class_name Hat

@export var hat_type = "MAGICIAN"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var sprites = $Sprites
	for sprite_child in sprites.get_children():
		if sprite_child.name != hat_type :
			(sprite_child as Sprite2D).visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
