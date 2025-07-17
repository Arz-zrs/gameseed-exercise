extends CanvasLayer

@onready var animation_player = $AnimationPlayer
@onready var color_rect = $ColorRect

func change_scene(scene_path: String):
	animation_player.play("fade_out")
	await animation_player.animation_finished

	get_tree().change_scene_to_file(scene_path)
	color_rect.color.a = 1.0
	animation_player.play("fade_in")
