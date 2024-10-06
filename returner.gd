extends StaticBody2D
signal returnedCoin (retValue :int)

		
func store(coin :StaticBody2D):
	var addvalue = coin.value
	emit_signal("returnedCoin", addvalue)
	coin.get_parent().remove_child(coin)


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body.is_in_group("Changeling") :
		body.container = self


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Changeling") :
		body.container = null

func is_empty():
	return true
