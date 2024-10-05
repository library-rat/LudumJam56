extends StaticBody2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func drop():
	var root = get_tree().get_nodes_in_group("VendingMachine").front()
	var init_position = self.global_position
	get_parent().remove_child(self)
	root.add_child(self)
	global_position = init_position
	
	set_collision_layer_value(1, true)
	
	
func grab(grabber : Node )-> void :
	var init_position = self.global_position
	get_parent().remove_child(self)
	grabber.add_child(self)
	global_position = init_position
	
	set_collision_layer_value(1,false)
