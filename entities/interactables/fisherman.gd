extends StaticBody2D


@export var dialogue_saved: Dialogue
@export var dialogue_thanks: Dialogue

var talked_to: bool = false


func interact():
	if not talked_to:
		GlobalSignals.show_dialogue.emit(dialogue_saved)
		talked_to = true
		Inventory.rod_seed = true
	else:
		GlobalSignals.show_dialogue.emit(dialogue_thanks)
