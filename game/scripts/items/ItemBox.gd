extends Area3D

@export var respawn_time: float = 5.0
@onready var mesh_instance = $MeshInstance3D
@onready var collision_shape = $CollisionShape3D

var is_collected = false

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if not is_collected and body.name == "PlayerKart":
		collect_item(body)

func collect_item(player):
	is_collected = true
	hide_item()
	give_item_to_player(player)
	await get_tree().create_timer(respawn_time).timeout
	respawn_item()

func give_item_to_player(player):
	if player.has_method("receive_item"):
		player.receive_item("speed_boost")
	print("Player received speed boost!")

func hide_item():
	mesh_instance.visible = false
	collision_shape.disabled = true

func respawn_item():
	is_collected = false
	mesh_instance.visible = true
	collision_shape.disabled = false
	print("Item box respawned")