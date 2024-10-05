extends CharacterBody2D


const SPEED = 300.0

@export var free_speed = 400

var grablist : Array[Node] = []
var grabbing : Node = null;


func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * free_speed
	if input_direction.length() !=0 :
		rotation = input_direction.angle()

func _input(event):
	if event.is_action_pressed("grab"):
		if grabbing != null :
			grabbing.drop()
		else :
			grabbing = grablist.front()

func _physics_process(delta : float) -> void:
	get_input()
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Coin"):
		print("append")
		grablist.append(body)


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Coin"):
		print("append")
		grablist.erase(body)
