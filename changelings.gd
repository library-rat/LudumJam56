extends CharacterBody2D


const SPEED = 300.0

@export var free_speed = 400
@export var loaded_speed = 50

var grabbing : StaticBody2D = null;
var container : StaticBody2D = null;

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if !grabbing :
		velocity = input_direction * free_speed
		if input_direction.length() !=0 :
			rotation = input_direction.angle()
	else :
		velocity = input_direction * loaded_speed

func _input(event):
	if event.is_action_pressed("grab"):
		if grabbing :
			if container and container.is_empty():
				container.store(grabbing)
			else:
				grabbing.drop()
			$CoinHitBox.set_deferred("disabled", true)
			grabbing = null
		else :
			for elt in $GrabArea.get_overlapping_bodies() :
				if elt.is_in_group("Coin"):
					grabbing = elt
					break
			if grabbing :
				grabbing.grab(self)
				$CoinHitBox.set_deferred("disabled", false)
			else :
				if container and not(container.is_empty()):
					grabbing = container.unstore(self)
					$CoinHitBox.set_deferred("disabled", false)

func _physics_process(delta : float) -> void:
	get_input()
	move_and_slide()
