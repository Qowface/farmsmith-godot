extends StaticBody2D


@export_multiline var smash_text: String
@export_multiline var block_text: String


func interact():
	if Inventory.pick:
		GlobalSignals.show_text_box.emit(smash_text)
		AudioPlayer.play_sfx("smash")
		queue_free()
	else:
		GlobalSignals.show_text_box.emit(block_text)
