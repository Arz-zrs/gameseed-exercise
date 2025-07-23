# For displaying messages, must always within the 'dialog_box' global group!!
extends Panel

var text_idx : int
var texts : Array[String]    # Series of texts, see the InteractableResource resource.

func start_dialog():
	visible = true
	text_idx = 0
	process_dialog()

func process_dialog():
	# Display the appropiate dialog
	print("test")
	if(text_idx < texts.size()):
		$Label.text = texts[text_idx]
	else:
		end_dialog()

func end_dialog():
	visible = false

func _input(event: InputEvent) -> void:
	# Navigate thru the dialog
	# Note for me : Fix conflicting input bug
	if(event.is_action_pressed("proceed") and visible == true):
		text_idx += 1
		process_dialog()

# NOTE : Panel isn't suitable as a dialog box, swap to something else later
