extends Timer

func _process(delta: float) -> void:
	if(paused == false):
		$Label.text = "%.1f" % time_left
