extends CollisionShape2D

func _on_fail_2_area_entered(area):
	get_parent().get_parent().fail2 = true
