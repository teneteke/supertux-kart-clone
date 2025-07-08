extends Area3D
signal race_finished(player)

@export var lap_count: int = 3
var players_laps: Dictionary = {}

func _ready():
	print("Finish Line Ready")
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "PlayerKart":
		handle_player_finish(body)

func handle_player_finish(player):
	if not players_laps.has(player):
		players_laps[player] = 0
	
	players_laps[player] += 1
	var current_lap = players_laps[player]
	
	print("Player completed lap %d/%d" % [current_lap, lap_count])
	
	if current_lap >= lap_count:
		race_finished.emit(player)
		print("Race Finished!")
	else:
		print("Lap %d complete! %d laps remaining" % [current_lap, lap_count - current_lap])

func get_player_lap(player):
	return players_laps.get(player, 0)