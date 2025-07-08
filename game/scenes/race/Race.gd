extends Node3D

@onready var timer_label = $UI/Timer
@onready var speed_label = $UI/Speed
@onready var track = $Track
@onready var players = $Players
@onready var player_kart = $Players/PlayerKart
@onready var finish_line = $Track/FinishLine

var race_time = 0.0
var is_racing = false
var race_completed = false

func _ready():
	print("SuperTux Kart Clone - Race Scene Ready")
	if finish_line:
		finish_line.race_finished.connect(_on_race_finished)
	start_race()

func _process(delta):
	if is_racing:
		race_time += delta
		update_timer()
		update_speed()

func start_race():
	print("Race Started!")
	is_racing = true
	race_time = 0.0

func update_timer():
	var minutes = int(race_time) / 60
	var seconds = int(race_time) % 60
	var milliseconds = int((race_time - int(race_time)) * 100)
	timer_label.text = "%02d:%02d.%02d" % [minutes, seconds, milliseconds]

func update_speed():
	if player_kart:
		var speed_kmh = player_kart.get_speed_kmh()
		speed_label.text = "%.0f km/h" % speed_kmh
	else:
		speed_label.text = "0 km/h"

func _on_race_finished(player):
	if not race_completed:
		race_completed = true
		is_racing = false
		print("Race completed! Final time: %.2f seconds" % race_time)
		show_race_results()

func show_race_results():
	var result_text = "Race Completed!\nTime: %.2f seconds\n\nPress ESC to return to menu"
	print(result_text)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/main/Main.tscn")