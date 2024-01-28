extends Node2D

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
	


