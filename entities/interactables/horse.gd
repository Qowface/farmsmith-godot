extends StaticBody2D


@export var dialogue_starting: Dialogue

var given_carrot_seed: bool = false


func interact():
	if !given_carrot_seed:
		GlobalSignals.show_dialogue.emit(dialogue_starting)
		given_carrot_seed = true
	else:
		GlobalSignals.show_text_box.emit("neigh!")
