class_name Plot
extends StaticBody2D


var crop: Crop:
	set(value):
		crop = value
		update_sprite()

var crop_stage: int = 1

@onready var crop_sprite: Sprite2D = $CropSprite


func _ready() -> void:
	GlobalSignals.day_ended.connect(grow)


func interact():
	if !crop:
		# No crop here, plant one
		if Inventory.axe_seed:
			plant(Crops.AXE)
			Inventory.axe_seed = false
			GlobalSignals.show_text_box.emit("axe seed\nplanted!")
		elif Inventory.seeds[Crops.CARROT] >= 1:
			plant(Crops.CARROT)
			Inventory.seeds[Crops.CARROT] -= 1
			GlobalSignals.show_text_box.emit("carrot seed\nplanted!")
	elif crop_stage == 1:
		# Still growing
		GlobalSignals.show_text_box.emit(str(crop.name) + " seed")
	elif crop_stage == 2:
		# Harvest grown crop
		harvest()


func plant(_crop: Crop):
	crop = _crop
	crop_stage = 1
	update_sprite()


func grow():
	if crop and crop_stage == 1:
		crop_stage = 2
		update_sprite()


func harvest():
	if Inventory.crops.has(crop):
		Inventory.crops[crop] += 1
	elif crop == Crops.AXE:
		Inventory.axe = true
	
	GlobalSignals.show_text_box.emit(str(crop.name) + "\nget!")
	crop = null
	update_sprite()


func update_sprite():
	if !crop:
		crop_sprite.texture = null
	elif crop_stage == 1 and crop.seed_sprite:
		crop_sprite.texture = crop.seed_sprite
	elif crop_stage == 2 and crop.crop_sprite:
		crop_sprite.texture = crop.crop_sprite
