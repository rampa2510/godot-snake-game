extends Area2D

var speed := 600
var score := 0
var direction := Vector2.ZERO

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area_that_entered: Area2D):
	print(area_that_entered.is_in_group("good_apple"))

func _process(delta: float) -> void:
	# Handle input
	if Input.is_action_just_pressed("move_left"):
		direction = Vector2.LEFT
	elif Input.is_action_just_pressed("move_right"):
		direction = Vector2.RIGHT
	elif Input.is_action_just_pressed("move_up"):
		direction = Vector2.UP
	elif Input.is_action_just_pressed("move_down"):
		direction = Vector2.DOWN
	
	position += direction * speed * delta*0.5
	wrap_snake_head()

func wrap_snake_head() -> void:
	var viewport_size := get_viewport_rect().size
	position.x = wrapf(position.x, 0, viewport_size.x)
	position.y = wrapf(position.y, 0, viewport_size.y)
