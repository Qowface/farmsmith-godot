extends StaticBody2D


@export_multiline var smash_text: String
@export_multiline var block_text: String


func interact():
	if Inventory.pick:
		GlobalSignals.show_text_box.emit(smash_text)
		queue_free()
	else:
		GlobalSignals.show_text_box.emit(block_text)
