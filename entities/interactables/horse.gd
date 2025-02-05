extends StaticBody2D


@export var dialogue_starting: Dialogue


func interact():
	GlobalSignals.show_dialogue.emit(dialogue_starting)
