extends Node2D


const TILE_SIZE = 8
const CAMERA_SIZE = 64

@onready var camera: Camera2D = $Camera
@onready var player: Player = $Player


func _ready() -> void:
	player.moved.connect(update_camera_position)


func update_camera_position() -> void:
	var x = floor(player.global_position.x / CAMERA_SIZE) * TILE_SIZE
	var y = floor(player.global_position.y / CAMERA_SIZE) * TILE_SIZE
	camera.global_position = Vector2(x * TILE_SIZE, y * TILE_SIZE)
