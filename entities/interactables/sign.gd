extends StaticBody2D


@export_multiline var sign_text: String


func interact():
	if sign_text:
		GlobalSignals.show_text_box.emit(sign_text)
