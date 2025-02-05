extends CanvasLayer


var current_dialogue: Dialogue
var current_line: int

@onready var text_box: Control = $TextBox
@onready var text_box_label: Label = $TextBox/TextBoxBG/TextBoxLabel


func _ready() -> void:
	hide_text_box()
	
	GlobalSignals.show_text_box.connect(show_text_box)
	GlobalSignals.show_dialogue.connect(show_dialogue)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("circle"):
		if text_box.visible:
			hide_text_box()
		if current_dialogue:
			next_dialogue_line()


func show_text_box(text: String) -> void:
	text_box_label.text = text
	text_box.show()
	GlobalSignals.ui_toggled.emit(true)


func hide_text_box() -> void:
	text_box.hide()
	text_box_label.text = ""
	GlobalSignals.ui_toggled.emit(false)


func show_dialogue(dialogue: Dialogue):
	current_dialogue = dialogue
	current_line = -1
	next_dialogue_line()


func next_dialogue_line():
	current_line += 1
	
	if current_line >= current_dialogue.lines.size():
		current_dialogue = null
		return
	
	show_text_box(current_dialogue.lines[current_line])
