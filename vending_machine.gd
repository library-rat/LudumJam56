extends Sprite2D

var CoinScene = preload("res://coin.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	coins()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func coins(): 
	for elt in get_tree().get_nodes_in_group("Coin") :
		elt.queue_free(
			
		)
	var spawnposition = $Spawner.position
	for i in range(20) :
		var xdiff = randi_range(-50,130)
		var ydiff = randf_range(-60, 70)
		var  new = CoinScene.instantiate()
		add_child(new)
		new.position.x =spawnposition.x + xdiff
		new.position.y = spawnposition.y + ydiff


func _on_coin_lever_change_coins() -> void:
	coins()
