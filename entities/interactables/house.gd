extends StaticBody2D


func interact():
	GlobalSignals.show_text_box.emit("you sleep for\nthe night", true)
	GlobalSignals.day_ended.emit()
