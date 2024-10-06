extends StaticBody2D

var possibleValues : Array = [5,10, 20, 50, 100, 200]
var textureValues : Array = [preload("res://CoinsPNG/CoinRed.png"),preload("res://CoinsPNG/CoinOrange.png"), preload("res://CoinsPNG/CoinOrangePale.png"),
preload("res://CoinsPNG/CoinGreyOrange.png"), preload("res://CoinsPNG/Coin2euro.png")]

var value : int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	set_value(possibleValues[randi()%6])

func set_value(value :int):
	match value :
		5 :
			$Sprite2D.texture = textureValues[0]
			scale.x = 0.5
			scale.y = 0.5
			$Label.text = "5"
		10 :
			$Sprite2D.texture = textureValues[1]
			scale.x = 0.6
			scale.y = 0.6
			$Label.text = "10"
		20 :
			$Sprite2D.texture = textureValues[1]
			scale.x = 0.7
			scale.y = 0.7
			$Label.text = "20"
		50 :
			$Sprite2D.texture = textureValues[2]
			scale.x = 0.8
			scale.y = 0.8
			$Label.text = "50"
		100 :
			$Sprite2D.texture = textureValues[3]
			scale.x = 1
			scale.y = 1
			$Label.text = "1"
		200 :
			$Sprite2D.texture = textureValues[4]
			scale.x = 1.2
			scale.y = 1.2
			$Label.text = "2"
	self.value = value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func drop():
	var root = get_tree().get_nodes_in_group("VendingMachine").front()
	var init_position = self.global_position
	get_parent().remove_child(self)
	root.add_child(self)
	global_position = init_position
	
	set_collision_layer_value(1, true)
	
	
func grab(grabber : Node )-> void :
	if(get_parent()):
		get_parent().remove_child(self)
	grabber.add_child(self)
	position = Vector2(40, 0)
	
	set_collision_layer_value(1,false)
