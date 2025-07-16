extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	## if any key is pressed start the game
	if Input.is_anything_pressed():
		$StartMenu.visible = false
		TransitionAnimation.change_scene("res://scenes/1259.tscn")
	
	pass
