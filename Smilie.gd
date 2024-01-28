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
	$SmilieSprite.self_modulate.a -= 0.4 *delta
	position += Vector2.UP *delta *30
	if existence_timer > 0 :
		existence_timer -=delta
	else:
		queue_free()
	
	

