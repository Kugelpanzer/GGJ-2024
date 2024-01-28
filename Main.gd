extends Node

@export var hoop_scene: PackedScene
@export var water_height =540
@export var hoop_comp = Array()
@export var x_offset = 100
@export var max_hoops = 3
@export var score_per_hoop = 5
@export var score_per_second = -1
var score
var hoops_passed

var current_hoop_list : Array = []
var list_of_points: Array = []

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	$Music.stop()
	$DeathSound.play()

func game_won():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_won()
	$Music.stop()
	#$WinSound.play()

func new_game():
	#get_tree().call_group(&"mobs", &"queue_free")
	score = 0
	hoops_passed = 0
	$Dolphin.start($StartPosition.position)
	$StartTimer.start()
	#$HUD.update_score(score)
	#$HUD.show_message("Get Ready")
	$Music.play()


func _process(delta):
	if $Dolphin.position.y < water_height:
		$Dolphin.in_water = false
	else:
		$Dolphin.in_water = true

func on_hoop_passed():
	score += score_per_hoop
	hoops_passed += 1
	if randf() < 0.3:
		spawn_happy_face()
	score_update()

func score_update():
	$HUD.update_score(score)

	#bad score
	if score <= -100: game_over()
	if score <= -80:
		if randf() < 0.3:
			spawn_sad_face()
	if score <= -60:
		if randf() < 0.3:
			spawn_sad_face()
	if score <= -40:
		if randf() < 0.3:
			spawn_sad_face()
	if score <= -20:
		if randf() < 0.3:
			spawn_sad_face()

	#good score
	if score >= 100: game_won()
	if score >= 80:
		if randf() < 0.3:
			spawn_happy_face()
	if score >= 60:
		if randf() < 0.3:
			spawn_happy_face()
	if score >= 40:
		if randf() < 0.3:
			spawn_happy_face()
	if score >= 20:
		if randf() < 0.3:
			spawn_happy_face()

func on_hoop_failed():
	if randf() < 0.3:
		spawn_sad_face()

func spawn_happy_face():
	var face_type = randi_range(1,3)

func spawn_sad_face():
	var face_type = randi_range(1,3)

func _on_MobTimer_timeout():
	# Create a new instance of the Mob scene.
	#print(current_hoop_list)
			
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
	score += score_per_second
	score_update()

func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	
