extends CanvasLayer

signal start_game

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func hide_message():
	$MessageLabel.hide()

func show_game_over():
	show_message("Game Over")
	await $MessageTimer.timeout
	hide_message()
	await get_tree().create_timer(1).timeout
	$StartButton.show()

func show_game_won()
	show_message("You Win!")
	await $MessageTimer.timeout
	hide_message()
	await get_tree().create_timer(1).timeout
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)


func _on_StartButton_pressed():
	$StartButton.hide()
	start_game.emit()


func _on_MessageTimer_timeout():
	$MessageLabel.hide()
