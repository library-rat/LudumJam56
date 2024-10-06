extends StaticBody2D

var storage : StaticBody2D
@onready var Sprite = $Sprite2D

@onready var EmptyTexture = load("res://ContainerPNG/StorageEmpty.png")
@onready var YellowTexture = load("res://ContainerPNG/Storage1E.png")
@onready var GreyTexture = load("res://ContainerPNG/Storage2E.png")
@onready var RedTexture = load("res://ContainerPNG/Storage5ct.png")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func store(coin :StaticBody2D):
	storage = coin
	coin.get_parent().remove_child(coin)
	$LabelStore.visible = false
	updateGrabLabel()
	$LabelGrab.visible = true
	update_texture()
	

func unstore(changeling : CharacterBody2D):
	if !storage:
		return
	storage.grab(changeling)
	var coin = storage
	storage = null
	$LabelStore.visible = true
	$LabelGrab.visible = false
	update_texture()
	return coin

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
		if body.container == self :
			body.container = null
		#$LabelStore.visible = false
		#$LabelGrab.visible = false

func is_empty():
	return storage==null
	
func updateGrabLabel():
	if storage :
		var val = storage.value
		$LabelGrab.text = "GRAB: %d.%d%d" %[val/100, val %100/10, val%10]

func update_texture():
	if !storage :
		Sprite.texture = EmptyTexture
	else :
		match storage.value :
			200 :
				Sprite.texture= GreyTexture
			5 :
				Sprite.texture = RedTexture
			_ :
				Sprite.texture = YellowTexture
