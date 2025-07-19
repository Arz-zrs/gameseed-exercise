extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.get_node("ingame_ui/timer").start()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("pause"):
		$PauseMenu.visible = true
		get_tree().paused = true
	
	pass
