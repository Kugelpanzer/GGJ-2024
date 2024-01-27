extends Area2D

signal hit



@export var max_speed = 1400 # How fast the player will move (pixels/sec).
@export var min_speed = 900
@export var acceleration = 7000
@export var gravity_acceleration = 1800

var velocity = Vector2.ZERO

var in_water = true 



var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size
	hide()


func _process(delta):
	if in_water:
		#find direction from dolphin to cursor, acceleration is in that direction
		var direction_to_cursor = get_viewport().get_mouse_position() - position
		var acceleration_vector = direction_to_cursor.normalized() * acceleration
		
		#randomize a bit angle and intensity of acceleration vector
		acceleration_vector = acceleration_vector.rotated(randf_range(-PI/36, PI/36))
		acceleration_vector = acceleration_vector.normalized() * acceleration_vector.length() * randf_range(0.7, 1.3)

		#calculate change in velocity		
		velocity += acceleration_vector * delta
		
		#clamp minimum and maximum velocity
		velocity = velocity.limit_length(max_speed)
		if velocity.length() < min_speed:
			velocity = velocity.normalized() * min_speed
	else:
		#out of water just fall down
		velocity += Vector2.DOWN * gravity_acceleration * delta

	#change position of delphin in direction of velocity
	position += velocity * delta

	#delphin is always pointing forward
	look_at(position + velocity)
	$AnimatedSprite2D.flip_v = velocity.x < 0

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false


func _on_Player_body_entered(_body):
	#hide() # Player disappears after being hit.
	#hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	print(_body)
	#$CollisionShape2D.set_deferred(&"disabled", true)
	
