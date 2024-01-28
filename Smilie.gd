extends Node2D

var existence_timer = 3
func _ready():
	#connect("body_entered", Hoop, "_on_body_entered")
	pass
	
func set_happy():
	$SmilieSprite.play("happy")
	$SmilieSprite.frame = randi_range(0,2)

func set_sad():
	$SmilieSprite.play("sad")
	$SmilieSprite.frame = randi_range(0,2)
# Connect the body_entered signal
	
func _process(delta):

	position += Vector2.UP *delta *55
	if existence_timer > 1 :
		existence_timer -=delta
	elif existence_timer > 0:
		$SmilieSprite.self_modulate.a -= 1.2 *delta
		existence_timer -=delta
	else:
		queue_free()
	
	

