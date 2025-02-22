class_name Player
extends Area2D


signal moved


const TILE_SIZE = 8
const INPUTS = {
	"right": Vector2.RIGHT,
	"left": Vector2.LEFT,
	"up": Vector2.UP,
	"down": Vector2.DOWN,
}

var in_ui: bool = false

@onready var sprite: Sprite2D = $Sprite
@onready var ray: RayCast2D = $Ray


func _ready() -> void:
	GlobalSignals.ui_toggled.connect(_on_ui_toggled)


func _process(delta: float) -> void:
	if in_ui:
		return
	
	for dir in INPUTS.keys():
		if Input.is_action_just_pressed(dir):
			move(dir)


func move(dir):
	ray.target_position = INPUTS[dir] * TILE_SIZE
	ray.force_raycast_update()
	
	if dir == "left":
		sprite.flip_h = true
	elif dir == "right":
		sprite.flip_h = false
	
	if !ray.is_colliding():
		position += INPUTS[dir] * TILE_SIZE
		moved.emit()
		return
	else:
		AudioPlayer.play_sfx("bump")
	
	var target = ray.get_collider()
	if target and target.has_method("interact"):
		target.interact()


func _on_ui_toggled(ui_visible: bool):
	in_ui = ui_visible
