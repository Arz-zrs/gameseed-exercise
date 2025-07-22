extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"1259/Player".get_node("ingame_ui").visible = false
	$"1259/Player/ingame_ui/timer/Label".visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	## if any key is pressed start the game
	if Input.is_anything_pressed():
		$StartMenu.visible = false
		TransitionAnimation.change_scene("res://tscn/1259.tscn")
	
	pass
