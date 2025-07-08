extends Node

signal engine_sound_updated(speed_ratio: float)

var base_engine_pitch = 0.8
var max_engine_pitch = 2.0

func _ready():
	print("Audio Manager initialized")

func update_engine_sound(speed_ratio: float):
	engine_sound_updated.emit(speed_ratio)