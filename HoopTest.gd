extends Node2D

var success = true 
var fail1 = false
var fail2 = false
var my_point = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func check_test():
	if success && !fail1 && !fail2: 
		print('final success \n')
		var hoop_list = get_parent().current_hoop_list
		hoop_list.erase(self)
		my_point.remove_object()

		queue_free()
	else:
		print('final fail \n')
	success = true
	fail1 = false
	fail2 = false
