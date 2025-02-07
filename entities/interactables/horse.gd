extends StaticBody2D


@export var dialogue_starting: Dialogue
@export var dialogue_plant: Dialogue
@export var dialogue_axe: Dialogue

var given_carrot_seed: bool = false
var given_carrot: bool = false


func interact():
	if !given_carrot_seed:
		GlobalSignals.show_dialogue.emit(dialogue_starting)
		given_carrot_seed = true
		Inventory.seeds[Crops.CARROT] += 1
	elif !given_carrot:
		if Inventory.crops[Crops.CARROT] < 1:
			GlobalSignals.show_dialogue.emit(dialogue_plant)
		else:
			GlobalSignals.show_dialogue.emit(dialogue_axe)
			given_carrot = true
			Inventory.crops[Crops.CARROT] -= 1
			Inventory.axe_seed = true
	else:
		GlobalSignals.show_text_box.emit("neigh!")
