extends Sprite2D

@export var resource : InteractableResource    # The object's data, Choose one from resource/variants Or create a new one
@onready var dialog = get_tree().get_first_node_in_group("dialog_box") as Panel    # Dialog box

func _ready() -> void:
	texture = resource.sprite    # Setup the sprite upon entering the scene

func _input(event: InputEvent) -> void:
	# Detect if the object is clicked
	if(event.is_action_pressed("use") and is_pixel_opaque(get_local_mouse_position())):
		# Collect objective item
		if(resource.isObjective):
			queue_free()
	# Start a dialog box if havent
		elif(dialog.visible == false):
			dialog.texts = resource.texts
			dialog.start_dialog()
