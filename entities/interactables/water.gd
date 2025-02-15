extends StaticBody2D


@export var has_boots: bool = false
@export var boots_dialogue: Dialogue
@export var no_bite_dialogue: Dialogue
@export_multiline var no_rod_text: String


func interact():
	if Inventory.rod:
		if has_boots and not Inventory.boots:
			GlobalSignals.show_dialogue.emit(boots_dialogue)
			Inventory.boots = true
		else:
			GlobalSignals.show_dialogue.emit(no_bite_dialogue)
	else:
		GlobalSignals.show_text_box.emit(no_rod_text)
