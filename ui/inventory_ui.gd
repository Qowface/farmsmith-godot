extends Control


@onready var gold_label: Label = $Container/GoldLabel
@onready var carrot_seed_label: Label = $Container/CarrotSeedLabel
@onready var carrot_label: Label = $Container/CarrotLabel
@onready var radish_seed_label: Label = $Container/RadishSeedLabel
@onready var radish_label: Label = $Container/RadishLabel
@onready var tomato_seed_label: Label = $Container/TomatoSeedLabel
@onready var tomato_label: Label = $Container/TomatoLabel
@onready var corn_seed_label: Label = $Container/CornSeedLabel
@onready var corn_label: Label = $Container/CornLabel


func _ready() -> void:
	hide()


func _process(delta: float) -> void:
	if Input.is_action_pressed("circle") and Input.is_action_pressed("x"):
		update_inventory_ui()
		show()
	else:
		hide()


func update_inventory_ui():
	gold_label.text = str(Inventory.gold)
	carrot_seed_label.text = str(Inventory.seeds[Crops.CARROT])
	carrot_label.text = str(Inventory.crops[Crops.CARROT])
	radish_seed_label.text = str(Inventory.seeds[Crops.RADISH])
	radish_label.text = str(Inventory.crops[Crops.RADISH])
	tomato_seed_label.text = str(Inventory.seeds[Crops.TOMATO])
	tomato_label.text = str(Inventory.crops[Crops.TOMATO])
	corn_seed_label.text = str(Inventory.seeds[Crops.CORN])
	corn_label.text = str(Inventory.crops[Crops.CORN])
