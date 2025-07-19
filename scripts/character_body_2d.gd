extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

#var inventory := PlayerInventory.new()
var inventory : PlayerInventory = ResourceLoader.load("res://player_inventory.tres").duplicate(true)

# for debug
var brass = load("res://tscn/items/brass_watch.tscn")
var battery = load("res://tscn/items/battery.tscn")

func _ready() -> void:
	
	$ingame_ui/Label.text = "Pieces : " + str(ItemManager.pieces)
	
	# Load items from the inventory into the player scene
	for item_idx in inventory.items:
		var item = inventory.items[item_idx].instantiate() as Item
		$ingame_ui/inventory_bar.display_icon(item.sprite)
		add_child(item)
	
	# Add item and save functionality [CURRENTLY FOR DEBUGGING PURPOSES ONLY]
	inventory.items[0] = brass
	inventory.items[1] = battery
	#var brass_watch = inventory.items[0].instantiate()
	#add_child(brass_watch)
	ResourceSaver.save(inventory, "res://player_inventory.tres")

func _physics_process(delta: float) -> void:
	
	## Direction 
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction:
		## Animation Placeholder will be changed into AnimationTree Implementation
		if Input.is_action_pressed("down"):
			$AnimationPlayer.play("walk_down")
		elif Input.is_action_pressed("up"):
			$AnimationPlayer.play("walk_up")
		elif Input.is_action_pressed("left"):
			$AnimationPlayer.play("walk_left")
		elif Input.is_action_pressed("right"):
			$AnimationPlayer.play("walk_right")
			
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()


func _on_timer_timeout() -> void:
	TransitionAnimation.change_scene("res://tscn/1259.tscn")
	pass # Replace with function body.


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("Hit")
	ItemManager.pieces += 1
	$ingame_ui/Label.text = "Pieces : " + str(ItemManager.pieces)
	get_parent().get_node("Pieces").queue_free()
	pass # Replace with function body.
