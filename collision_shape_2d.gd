extends CollisionShape2D



func _on_detect_player_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Changeling") :
		body.container = self
		#if(body.grabbing):
			#if is_empty() :
				#$LabelStore.visible = true
		#else:
			#if ! is_empty():
				#updateGrabLabel()
				#$LabelGrab.visible = true

func _on_detect_player_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("Changeling") :
		body.container = null
		#$LabelStore.visible = false
		#$LabelGrab.visible = false
