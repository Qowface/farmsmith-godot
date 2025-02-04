extends CanvasLayer


@onready var text_box: Control = $TextBox
@onready var text_box_label: Label = $TextBox/TextBoxBG/TextBoxLabel


func _ready() -> void:
	hide_text_box()
	
	GlobalSignals.show_text_box.connect(show_text_box)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("circle"):
		hide_text_box()


func show_text_box(text: String) -> void:
	text_box_label.text = text
	text_box.show()


func hide_text_box() -> void:
	text_box.hide()
	text_box_label.text = ""
