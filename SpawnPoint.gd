extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().list_of_points.append(self)

	
func add_object(object):
	object.my_point = self
	get_parent().list_of_points.erase(self)
	#print(get_parent().list_of_points)
	
func remove_object():
	get_parent().list_of_points.append(self)
	
	


