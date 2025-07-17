extends CharacterBody2D

#var inventory := PlayerInventory.new()
var inventory : PlayerInventory = ResourceLoader.load("res://player_inventory.tres").duplicate(true)

# for debug
var brass = load("res://tscn/items/brass_watch.tscn")
var battery = load("res://tscn/items/battery.tscn")

func _ready() -> void:
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
	
	print(inventory.items)
