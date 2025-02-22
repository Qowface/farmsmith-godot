extends Node


const SFX = {
	"bump": preload("res://assets/audio/sfx_0_bump.wav"),
	"plant": preload("res://assets/audio/sfx_1_plant.wav"),
	"chop": preload("res://assets/audio/sfx_2_chop.wav"),
	"smash": preload("res://assets/audio/sfx_3_smash.wav"),
	"coin": preload("res://assets/audio/sfx_4_coin.wav"),
	"harvest": preload("res://assets/audio/sfx_5_harvest.wav"),
	"beep": preload("res://assets/audio/sfx_6_beep.wav"),
}

@onready var music_player: AudioStreamPlayer = $MusicPlayer
@onready var sfx_player: AudioStreamPlayer = $SFXPlayer


func play_sfx(sfx_name: String):
	if !SFX.has(sfx_name):
		push_warning("Invalid sfx_name: " + sfx_name)
		return
	
	sfx_player.stream = SFX[sfx_name]
	sfx_player.play()
