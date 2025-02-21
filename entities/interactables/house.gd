extends StaticBody2D


@export_multiline var sleep_text: String


func interact():
	GlobalSignals.show_text_box.emit(sleep_text, true)
	GlobalSignals.day_ended.emit()
	GlobalData.day += 1
