extends Item

# Clean up task (if the time suffice):
# Create state machine for each items

func action() -> void:
	# Pause game timer and start freeze timer
	$"../timer".paused = true
	$duration.start()
	$CanvasLayer.visible = true


func _unhandled_input(event: InputEvent) -> void:
	# Freeze Trigger
	if(event.is_action_pressed("use") and $duration.is_stopped() == true):
		action()


func _on_duration_timeout() -> void:
	# Resume game timer
	$CanvasLayer.visible = false
	$"../timer".paused = false
	

func _process(delta: float) -> void:
	# Display remaining frozen time
	if($duration.is_stopped() == false):
		$CanvasLayer/Label.text = "%.1f" % $duration.time_left
