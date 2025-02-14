extends StaticBody2D


@export var dialogue_starting: Dialogue
@export var dialogue_no_gold: Dialogue
@export var dialogue_give_gold: Dialogue
@export_multiline var text_thanks: String

var talked_to: bool = false
var given_gold: bool = false


func interact():
	if not talked_to:
		GlobalSignals.show_dialogue.emit(dialogue_starting)
		talked_to = true
	elif not given_gold:
		if Inventory.gold < 110:
			GlobalSignals.show_dialogue.emit(dialogue_no_gold)
		else:
			GlobalSignals.show_dialogue.emit(dialogue_give_gold)
			given_gold = true
			Inventory.gold -= 100
			Inventory.pick_seed = true
	else:
		GlobalSignals.show_text_box.emit(text_thanks)
