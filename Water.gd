extends Node2D

@export var water_height = 540

func _ready():
	var screen_width = 1920 #get_viewport().size[0]
	var screen_height = 1080  #get_viewport().size[1]
	$WhitePixel.position = Vector2(screen_width / 2,screen_height - water_height / 2)
	$WhitePixel.scale = Vector2(screen_width / 4, water_height / 4)
	#get_tree().get_root().size_changed.connect(resize)
