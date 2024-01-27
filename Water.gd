extends Node2D

@export var water_height = 540

var water_line =[]
# Called when the node enters the scene tree for the first time.
func _ready():
	var screen_width = 1920 #get_viewport().size[0]
	var screen_height = 1080  #get_viewport().size[1]
	water_line.append(Vector2(0,screen_height - water_height))
	water_line.append(Vector2(screen_width,screen_height - water_height))
	#get_tree().get_root().size_changed.connect(resize)
	

func resize():
	var screen_width = 1920 #get_viewport().size[0]
	var screen_height = 1080  #get_viewport().size[1]
	water_line[0] = Vector2(0,screen_height - water_height)
	water_line[1] = Vector2(screen_width,screen_height - water_height)
	print(screen_width)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _draw():
	var screen_width = get_viewport().size[0]
	var screen_height = get_viewport().size[1]
	draw_line(water_line[0],water_line[1],Color.RED)
