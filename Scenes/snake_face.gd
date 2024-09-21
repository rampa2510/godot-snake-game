extends Sprite2D

var speed:=600

var steering_factor := 5

var direction := Vector2(0,0)
var velocity := Vector2(0,0)
var desired_velocity := Vector2(0,0)
var steering_velocity := Vector2(0,0)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	direction.x = Input.get_axis("move_left","move_right")
	direction.y = Input.get_axis("move_up","move_down")
	
	if direction.length() > 1:
		direction = direction.normalized()
		
	
	desired_velocity = direction * speed
	steering_velocity = desired_velocity - velocity
		
	velocity += steering_velocity * steering_factor *delta
	position += velocity * delta
	
