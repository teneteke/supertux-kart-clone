extends Node3D

@onready var start_button = $UI/StartButton

func _ready():
	print("SuperTux Kart Clone - Main Scene Ready")
	start_button.pressed.connect(_on_start_button_pressed)

func _on_start_button_pressed():
	print("Starting race...")
	get_tree().change_scene_to_file("res://scenes/race/Race.tscn")