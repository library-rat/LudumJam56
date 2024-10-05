extends CharacterBody2D


const SPEED = 300.0

@export var free_speed = 400


var grabbing : Node = null;


func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * free_speed
	if input_direction.length() !=0 :
		rotation = input_direction.angle()

func _input(event):
	if event.is_action_pressed("grab"):
		if grabbing :
			grabbing.drop()
			grabbing = null
		else :
			for elt in $GrabArea.get_overlapping_bodies() :
				print($GrabArea.get_overlapping_bodies())
				if elt.is_in_group("Coin"):
					grabbing = elt
					break
			print(grabbing)
			if grabbing :
				grabbing.grab(self)


func _physics_process(delta : float) -> void:
	get_input()
	move_and_slide()
