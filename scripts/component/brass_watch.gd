extends Item

# Clean up task (if the time suffice):
# Create state machine for each items

@onready var player = self.get_parent()
var battery : int

func _ready() -> void:
	battery = count_battery(player.inventory)

func action() -> void:
	# Pause game timer and start freeze timer
<<<<<<< Updated upstream:scripts/component/brass_watch.gd
	$"../timer".paused = true
	$duration.start()
	$CanvasLayer.visible = true

=======
	if(battery > 0):
		$"../ingame_ui/timer".paused = true
		$duration.start()
		battery -= 1
>>>>>>> Stashed changes:script/brass_watch.gd

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

func count_battery(inventory : PlayerInventory) -> int:
	var count : int
	for idx in inventory.items:
		if(inventory.items[idx]["name"] == "battery"):
			count += 1
	return count
