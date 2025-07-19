extends Node

#var inventory := PlayerInventory.new()
var inventory : PlayerInventory = ResourceLoader.load("res://player_inventory.tres").duplicate(true)

# for debug
var brass = load("res://scenes/items/brass_watch.tscn")
var battery = load("res://scenes/items/battery.tscn")


func _ready() -> void:
		
	$Label.text = "Pieces : " + str(ItemManager.pieces)
	
	# Load items from the inventory into the player scene
	for item_idx in inventory.items:
		var item = inventory.items[item_idx].instantiate() as Item
		$inventory_bar.display_icon(item.sprite)
		add_child(item)
	
	# Add item and save functionality [CURRENTLY FOR DEBUGGING PURPOSES ONLY]
	#inventory.items[0] = brass
	#inventory.items[1] = battery
	#var brass_watch = inventory.items[0].instantiate()
	#add_child(brass_watch)
	ResourceSaver.save(inventory, "res://player_inventory.tres")


func _process(delta: float) -> void:
	if(inventory.pieces < ItemManager.pieces):
		inventory.pieces = ItemManager.pieces
		$Label.text = "Pieces : " + str(ItemManager.pieces)
		ResourceSaver.save(inventory, "res://player_inventory.tres")
