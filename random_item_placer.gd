extends Node2D

var items := [
	preload("res://Scenes/apple.tscn")
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Timer").timeout.connect(add_item_on_scene)


func add_item_on_scene() -> void:
	
	var viewport_size = get_viewport_rect().size
	
	var random_position := Vector2(0, 0)
	random_position.x = randf_range(0, viewport_size.x )
	random_position.y = randf_range(0, viewport_size.y )
	
	var random_item:PackedScene = items.pick_random()
	var random_scene = random_item.instantiate()
	
	random_scene.position = random_position
	
	add_child(random_scene)
