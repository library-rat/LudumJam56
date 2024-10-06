extends StaticBody2D


signal change_coins
		#if(body.grabbing):
			#if is_empty() :
				#$LabelStore.visible = true
		#else:
			#if ! is_empty():
				#updateGrabLabel()
				#$LabelGrab.visible = true

		#$LabelStore.visible = false
		#$LabelGrab.visible = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Changeling") :
		body.container = self


func _on_area_2d_body_exited(body: Node2D) -> void:
		if body.is_in_group("Changeling") :
			body.container = null

func unstore(node):
	print("give new coins")
	emit_signal("change_coins")
	return null

func store() :
	pass

func is_empty():
	return false
