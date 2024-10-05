extends CharacterBody2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var root = get_tree().get_nodes_in_group("VendingMachine").front()
	get_parent().remove_child(self)
	root.add_child(self)
	
func grab(grabber : Node )-> void :
	get_parent().remove_child(self)
	grabber.add_child(self)
