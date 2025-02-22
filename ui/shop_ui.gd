extends Control


@export var buy_text: String
@export var sell_text: String

var current_selection: int
var option_count: int
var selling: bool = false

@onready var crop_label: Label = $Background/CropLabel
@onready var crop_sprite: TextureRect = $Background/CropSprite
@onready var price_label: Label = $Background/PriceLabel
@onready var gold_label: Label = $Background/GoldLabel
@onready var buttons_label: Label = $Background/ButtonsLabel


func _ready() -> void:
	current_selection = 0
	option_count = Crops.CROPS.size()
	
	GlobalSignals.start_shopping.connect(start_shopping)
	
	hide()


func _process(delta: float) -> void:
	if !visible:
		return
	
	if Input.is_action_just_pressed("left"):
		current_selection -= 1
		if current_selection < 0:
			current_selection = option_count - 1
		update_ui()
		AudioPlayer.play_sfx("beep")
	elif Input.is_action_just_pressed("right"):
		current_selection += 1
		if current_selection >= option_count:
			current_selection = 0
		update_ui()
		AudioPlayer.play_sfx("beep")
	
	if Input.is_action_just_pressed("circle"):
		var crop = Crops.CROPS[current_selection]
		if selling:
			sell_crop(crop)
		else:
			buy_seed(crop)
		update_ui()
	elif Input.is_action_just_pressed("x"):
		AudioPlayer.play_sfx("bump")
		stop_shopping()


func update_ui():
	var crop: Crop = Crops.CROPS[current_selection]
	crop_sprite.texture = crop.crop_sprite
	gold_label.text = str(Inventory.gold)
	
	if selling:
		crop_label.text = crop.name + " (" + str(Inventory.crops[crop]) + ")"
		price_label.text = "price:" + str(crop.crop_price)
		buttons_label.text = sell_text
	else:
		crop_label.text = crop.name + " (" + str(Inventory.seeds[crop]) + ")"
		price_label.text = "price:" + str(crop.seed_price)
		buttons_label.text = buy_text


func start_shopping(is_selling: bool):
	selling = is_selling
	update_ui()
	GlobalSignals.ui_toggled.emit(true)
	set_deferred("visible", true) # deferred so player movement input doesn't carry over to UI


func stop_shopping():
	GlobalSignals.ui_toggled.emit(false)
	set_deferred("visible", false)


func buy_seed(crop: Crop):
	if Inventory.gold >= crop.seed_price:
		Inventory.gold -= crop.seed_price
		Inventory.seeds[crop] += 1
		AudioPlayer.play_sfx("coin")
	else:
		AudioPlayer.play_sfx("bump")


func sell_crop(crop: Crop):
	if Inventory.crops[crop] >= 1:
		Inventory.gold += crop.crop_price
		Inventory.crops[crop] -= 1
		AudioPlayer.play_sfx("coin")
	else:
		AudioPlayer.play_sfx("bump")
