extends Node

@export var mob_scene: PackedScene
@export var water_height =540
@export var hoop_comp = Array()
@export var x_offset = 100
@export var max_hoops = 1
var score

var setups : Array = []
var vector_list_1 = [Vector2(1, 2), Vector2(3, 4), Vector2(5, 6)]
var vector_list_2 = [Vector2(7, 8), Vector2(9, 10), Vector2(11, 12)]

var current_hoop_list : Array = []

func game_over():
	$ScoreTimer.stop()
	$HoopTimer.stop()
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
	
	if max_hoops <= current_hoop_list.size():
		return
	var mob = mob_scene.instantiate()
	current_hoop_list.append(mob)

	# Choose a random location on Path2D.
	var mob_spawn_location = get_node(^"MobPath/MobSpawnLocation")
	mob_spawn_location.progress = randi()

	# Set the mob's direction perpendicular to the path direction.
	#var direction = mob_spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position

	# Add some randomness to the direction.
	#direction += randf_range(-PI / 4, PI / 4)
	#mob.rotation = direction

	# Choose the velocity for the mob.
	#var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	#mob.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)


func _on_StartTimer_timeout():
	$HoopTimer.start()
	$ScoreTimer.start()
	
