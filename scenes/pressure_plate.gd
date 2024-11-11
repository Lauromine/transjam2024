extends Area2D
class_name Plate

@export var plate_type = "UNPRESSED"
@export var key_scene: PackedScene 
@export var key_postition: Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var sprites = $Sprites
	for sprite_child in sprites.get_children():
		if sprite_child.name != plate_type :
			(sprite_child as Sprite2D).visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	pass


func _on_body_entered(body):
	var key_instance = key_scene.instantiate()
	key_instance.transform = key_postition.transform
