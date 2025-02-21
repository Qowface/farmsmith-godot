extends Control


@export var question_sprite: CompressedTexture2D
@export var tool_seed_sprite: CompressedTexture2D
@export var axe_sprite: CompressedTexture2D
@export var pick_sprite: CompressedTexture2D
@export var rod_sprite: CompressedTexture2D
@export var boots_sprite: CompressedTexture2D
@export var frog_boots_sprite: CompressedTexture2D

@onready var gold_label: Label = $Container/GoldLabel
@onready var day_label: Label = $Container/DayLabel
@onready var carrot_seed_label: Label = $Container/CarrotSeedLabel
@onready var carrot_label: Label = $Container/CarrotLabel
@onready var radish_seed_label: Label = $Container/RadishSeedLabel
@onready var radish_label: Label = $Container/RadishLabel
@onready var tomato_seed_label: Label = $Container/TomatoSeedLabel
@onready var tomato_label: Label = $Container/TomatoLabel
@onready var corn_seed_label: Label = $Container/CornSeedLabel
@onready var corn_label: Label = $Container/CornLabel
@onready var axe_stage_sprite: TextureRect = $Container/AxeStageSprite
@onready var pick_stage_sprite: TextureRect = $Container/PickStageSprite
@onready var rod_stage_sprite: TextureRect = $Container/RodStageSprite
@onready var boot_stage_sprite: TextureRect = $Container/BootStageSprite


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
	day_label.text = "day " + str(GlobalData.day)
	
	carrot_seed_label.text = str(Inventory.seeds[Crops.CARROT])
	carrot_label.text = str(Inventory.crops[Crops.CARROT])
	radish_seed_label.text = str(Inventory.seeds[Crops.RADISH])
	radish_label.text = str(Inventory.crops[Crops.RADISH])
	tomato_seed_label.text = str(Inventory.seeds[Crops.TOMATO])
	tomato_label.text = str(Inventory.crops[Crops.TOMATO])
	corn_seed_label.text = str(Inventory.seeds[Crops.CORN])
	corn_label.text = str(Inventory.crops[Crops.CORN])
	
	if Inventory.axe:
		axe_stage_sprite.texture = axe_sprite
	elif Inventory.axe_seed:
		axe_stage_sprite.texture = tool_seed_sprite
	else:
		axe_stage_sprite.texture = question_sprite
	
	if Inventory.pick:
		pick_stage_sprite.texture = pick_sprite
	elif Inventory.pick_seed:
		pick_stage_sprite.texture = tool_seed_sprite
	else:
		pick_stage_sprite.texture = question_sprite
	
	if Inventory.rod:
		rod_stage_sprite.texture = rod_sprite
	elif Inventory.rod_seed:
		rod_stage_sprite.texture = tool_seed_sprite
	else:
		rod_stage_sprite.texture = question_sprite
	
	if Inventory.frog_boots:
		boot_stage_sprite.texture = frog_boots_sprite
	elif Inventory.boots:
		boot_stage_sprite.texture = boots_sprite
	else:
		boot_stage_sprite.texture = question_sprite
