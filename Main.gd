extends Node

@export var hoop_scene: PackedScene
@export var water_height =540
@export var hoop_comp = Array()
@export var x_offset = 100
@export var max_hoops = 3
var score

var current_hoop_list : Array = []
var list_of_points: Array = []

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	$Music.stop()
	$DeathSound.play()


func new_game():
	#get_tree().call_group(&"mobs", &"queue_free")
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	#$HUD.update_score(score)
	#$HUD.show_message("Get Ready")
	$Music.play()


func _process(delta):
	if $Player.position.y < water_height:
		$Player.in_water = false
	else:
		$Player.in_water = true

func _on_MobTimer_timeout():

	# Create a new instance of the Mob scene.
	print(current_hoop_list)
			
	if max_hoops <= current_hoop_list.size():
		return
	var hoop = hoop_scene.instantiate()
	current_hoop_list.append(hoop)

	# Choose a random location on Path2D.
	#var hoop_spawn_location = get_node(^"HoopPath/HoopSpawnLocation")
	#hoop_spawn_location.progress = randi()
	var point = list_of_points.pick_random()
	point.add_object(hoop)
	hoop.position = point.position#hoop_spawn_location.position

	# Spawn the mob by adding it to the Main scene.
	add_child(hoop)


func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)


func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	
