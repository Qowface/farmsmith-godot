extends Control


var current_selection: int
var option_count: int
var plot: Plot

@onready var crop_label: Label = $Background/CropLabel
@onready var crop_sprite: TextureRect = $Background/CropSprite


func _ready() -> void:
	current_selection = 0
	option_count = Crops.CROPS.size()
	
	GlobalSignals.start_planting.connect(start_planting)
	
	hide()


func _process(delta: float) -> void:
	if !visible:
		return
	
	if Input.is_action_just_pressed("left"):
		current_selection -= 1
		if current_selection < 0:
			current_selection = option_count - 1
		update_crop()
	elif Input.is_action_just_pressed("right"):
		current_selection += 1
		if current_selection >= option_count:
			current_selection = 0
		update_crop()
	
	if Input.is_action_just_pressed("circle"):
		var crop = Crops.CROPS[current_selection]
		if Inventory.seeds[crop] >= 1:
			plot.plant(crop)
			Inventory.seeds[crop] -= 1
			stop_planting()
	elif Input.is_action_just_pressed("x"):
		stop_planting()


func update_crop():
	var crop = Crops.CROPS[current_selection]
	crop_label.text = crop.name + " (" + str(Inventory.seeds[crop]) + ")"
	crop_sprite.texture = crop.crop_sprite


func start_planting(target_plot: Plot):
	update_crop()
	plot = target_plot
	GlobalSignals.ui_toggled.emit(true)
	set_deferred("visible", true) # deferred so player movement input doesn't carry over to UI


func stop_planting():
	GlobalSignals.ui_toggled.emit(false)
	set_deferred("visible", false)
