extends CollisionShape2D

func _on_fail_1_area_entered(area):
	get_parent().get_parent().fail1 = true
	print("fail1")
