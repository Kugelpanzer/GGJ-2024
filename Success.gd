extends CollisionShape2D


func _on_success_area_entered(area):
	get_parent().get_parent().success = true


func _on_success_area_exited(area):
	get_parent().get_parent().check_test()
