extends Area2D

signal hit



@export var max_speed = 1200 # How fast the player will move (pixels/sec).
@export var min_speed = 800
@export var acceleration = 8000
@export var gravity_acceleration = 100

var velocity = Vector2.ZERO

var in_water = true 



var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size
	hide()


func _process(delta):
	var direction_to_cursor
	var acceleration_vector
	if in_water:
		direction_to_cursor = get_viewport().get_mouse_position() - position
		acceleration_vector = direction_to_cursor.normalized() * acceleration
	else:
		acceleration_vector = Vector2.DOWN * acceleration
	
	acceleration_vector = acceleration_vector.rotated(randf_range(-PI/18, PI/18))
	acceleration_vector = acceleration_vector.normalized() * acceleration_vector.length() * randf_range(0.9, 1.1)
		
	velocity += acceleration_vector * delta

	velocity = velocity.limit_length(max_speed)
	if velocity.length() < min_speed:
		velocity = velocity.normalized() * min_speed
		
	position += velocity * delta
	look_at(position + velocity)
	#if(velocity > max_speed)
	#	velocity = max_speed
	#position = get_viewport().get_mouse_position()
	

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false


func _on_Player_body_entered(_body):
	hide() # Player disappears after being hit.
	hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred(&"disabled", true)
