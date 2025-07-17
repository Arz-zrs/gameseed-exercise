extends Item

func action() -> void:
	$"../ingame_ui/Timer".stop()

func _unhandled_input(event: InputEvent) -> void:
	if(event.is_action_pressed("use")):
		action()
