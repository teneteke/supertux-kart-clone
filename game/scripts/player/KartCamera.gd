extends Camera3D

@export var target: Node3D
@export var follow_distance: float = 8.0
@export var follow_height: float = 4.0
@export var follow_speed: float = 5.0
@export var look_ahead_distance: float = 3.0

var desired_position: Vector3
var desired_rotation: Vector3

func _ready():
	if not target:
		var parent = get_parent()
		if parent:
			target = parent

func _process(delta):
	if target:
		update_camera_position(delta)

func update_camera_position(delta):
	var target_forward = -target.global_transform.basis.z
	var target_velocity = Vector3.ZERO
	
	if target is RigidBody3D:
		target_velocity = target.linear_velocity
	
	var look_ahead_offset = target_velocity.normalized() * look_ahead_distance
	var desired_look_at = target.global_position + look_ahead_offset
	
	desired_position = target.global_position - target_forward * follow_distance + Vector3.UP * follow_height
	
	global_position = global_position.lerp(desired_position, follow_speed * delta)
	
	look_at(desired_look_at, Vector3.UP)