extends RigidBody2D

func _ready():
	#connect("body_entered", Hoop, "_on_body_entered")
	"""
	$AnimatedSprite2D.play()
	var mob_types = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation = mob_types.pick_random()
	"""

	"""
	var tween = get_tree().create_tween()
	tween.tween_property($AnimatedSprite2D, "scale", Vector2(), 1).set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property($AnimatedSprite2D, "modulate", Color.RED, 1).set_trans(Tween.TRANS_SINE)
	tween.tween_callback($AnimatedSprite2D.queue_free)
	"""

# Connect the body_entered signal
	


