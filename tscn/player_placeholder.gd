extends CharacterBody2D

# Warning: v Obsolete codes meant for educational purposes, do not erase v

#var inventory := PlayerInventory.new()
var inventory : PlayerInventory = ResourceLoader.load("res://player_inventory.tres").duplicate(true)

# for debug
var brass = load("res://tscn/items/brass_watch.tscn")
var battery = load("res://tscn/items/battery.tscn")

func _ready() -> void:
	# Load items from the inventory into the player scene
	for item_idx in inventory.items:
		var item = inventory.items[item_idx]["item"].instantiate() as Item
		$ingame_ui/inventory_bar.display_icon(item.sprite)
		add_child(item)
	
	# Add item and save the inventory [CURRENTLY FOR DEBUGGING PURPOSES ONLY]
	#inventory.items[0] = {"item" : brass, "name" : "brass"}
	#inventory.items[1] = {"item" : battery, "name" : "battery"}
	#ResourceSaver.save(inventory, "res://player_inventory.tres")
	
	print(inventory.items)
