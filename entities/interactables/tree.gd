extends StaticBody2D


@export_multiline var chop_text: String
@export_multiline var block_text: String


func interact():
	if Inventory.axe:
		GlobalSignals.show_text_box.emit(chop_text)
		AudioPlayer.play_sfx("chop")
		queue_free()
	else:
		GlobalSignals.show_text_box.emit(block_text)
