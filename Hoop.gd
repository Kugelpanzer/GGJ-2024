extends RigidBody2D

func _ready():
	connect("body_entered", Hoop, "_on_body_entered")
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
	

# Handle the body_entered signal
func _on_body_entered(body):
	if body.is_in_group("collider_group_1"):
		print("Collided with Collider Group 1")
	elif body.is_in_group("collider_group_2"):
		print("Collided with Collider Group 2")
	else:
		print("Collided with an unknown collider")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

