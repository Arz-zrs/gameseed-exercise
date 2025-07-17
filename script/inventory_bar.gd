extends Node2D


func display_icon(texture : CompressedTexture2D) -> void:
	var item_icon = TextureRect.new()
	item_icon.texture = texture
	item_icon.expand_mode = TextureRect.EXPAND_FIT_WIDTH
	item_icon.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT
	$items.add_child(item_icon)
