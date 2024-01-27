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
	velocity += direction_to_cursor.normalized() * acceleration * delta
	
	if velocity.length() >= max_speed:
		velocity = velocity.normalized() * max_speed
		
	print(direction_to_cursor.angle_to(velocity))
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
