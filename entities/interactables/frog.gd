extends StaticBody2D


@export var boots_sprite: CompressedTexture2D
@export var dialogue_default: Dialogue
@export var dialogue_found_boots: Dialogue
@export var dialogue_you_won: Dialogue

var boots_on_frog: bool = false

@onready var sprite: Sprite2D = $Sprite


func interact():
	if !boots_on_frog:
		if Inventory.boots:
			GlobalSignals.show_dialogue.emit(dialogue_found_boots)
			sprite.texture = boots_sprite
			boots_on_frog = true
		else:
			GlobalSignals.show_dialogue.emit(dialogue_default)
	else:
		GlobalSignals.show_dialogue.emit(dialogue_you_won)
