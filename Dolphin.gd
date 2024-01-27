extends Area2D

signal hit



@export var max_speed = 1200 # How fast the player will move (pixels/sec).
@export var rotation_speed = 1
@export var acceleration = 2000

var velocity = Vector2.ZERO

var is_in_water = true 



var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size
	hide()


func _process(delta):
	var direction_to_cursor = get_viewport().get_mouse_position() - position
	var acceleration_vector = direction_to_cursor.normalized() * acceleration
	
	"""
	var angle_of_acceleration = velocity.angle_to(acceleration_vector)
	if angle_of_acceleration > PI / 4:
		acceleration_vector.rotated(angle_of_acceleration - PI / 4)
	elif angle_of_acceleration < -PI / 4:
		acceleration_vector.rotated(angle_of_acceleration + PI / 4)
	"""
	
	velocity += acceleration_vector * delta
	
	velocity = velocity.limit_length(max_speed)
		
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
