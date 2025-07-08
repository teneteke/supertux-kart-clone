extends RigidBody3D

@export var max_speed: float = 25.0
@export var acceleration: float = 8.0
@export var turn_speed: float = 1.5
@export var obstacle_avoidance_distance: float = 5.0

@onready var wheels = $Wheels
@onready var wheel_fl = $Wheels/WheelFL
@onready var wheel_fr = $Wheels/WheelFR
@onready var wheel_rl = $Wheels/WheelRL
@onready var wheel_rr = $Wheels/WheelRR
@onready var engine_audio = $EngineAudio

var waypoints = [
	Vector3(0, 0, -20),
	Vector3(0, 0, 0),
	Vector3(0, 0, 20),
	Vector3(-15, 0, 15),
	Vector3(15, 0, -15),
	Vector3(0, 0, -20)
]
var current_waypoint_index = 0
var current_speed = 0.0
var wheel_rotation = 0.0
var max_steering_angle = 0.3
var current_steering_input = 0.0

func _ready():
	print("AI Kart initialized with waypoint navigation")
	setup_engine_audio()

func _process(delta):
	update_wheel_animation(delta)
	update_engine_audio()

func _physics_process(delta):
	ai_movement(delta)
	obstacle_avoidance(delta)

func ai_movement(delta):
	var forward = -global_transform.basis.z
	current_speed = linear_velocity.length()
	
	var target_position = waypoints[current_waypoint_index]
	var distance_to_target = global_position.distance_to(target_position)
	
	if distance_to_target < 5.0:
		current_waypoint_index = (current_waypoint_index + 1) % waypoints.size()
		print("AI moving to waypoint ", current_waypoint_index)
	
	if current_speed < max_speed:
		apply_central_force(forward * acceleration * 80 * delta)
	
	ai_steering(delta)

func ai_steering(delta):
	var target_position = waypoints[current_waypoint_index]
	var direction_to_target = (target_position - global_position).normalized()
	var forward = -global_transform.basis.z
	
	var cross_product = forward.cross(direction_to_target)
	var turn_amount = cross_product.y * turn_speed * delta
	
	current_steering_input = clamp(cross_product.y, -1.0, 1.0)
	
	if abs(turn_amount) > 0.1 and current_speed > 0.5:
		apply_torque(Vector3(0, turn_amount * 30, 0))

func obstacle_avoidance(delta):
	var space_state = get_world_3d().direct_space_state
	var forward = -global_transform.basis.z
	
	var query = PhysicsRayQueryParameters3D.create(
		global_position + Vector3(0, 0.5, 0),
		global_position + forward * obstacle_avoidance_distance + Vector3(0, 0.5, 0)
	)
	query.exclude = [self]
	
	var result = space_state.intersect_ray(query)
	
	if result:
		var obstacle_direction = (result.position - global_position).normalized()
		var avoid_direction = Vector3(-obstacle_direction.z, 0, obstacle_direction.x)
		apply_central_force(avoid_direction * acceleration * 50 * delta)

func update_wheel_animation(delta):
	var wheel_radius = 0.3
	var wheel_circumference = 2 * PI * wheel_radius
	
	var rotation_speed = current_speed / wheel_circumference
	wheel_rotation += rotation_speed * delta
	
	if wheel_fl and wheel_fr and wheel_rl and wheel_rr:
		wheel_fl.rotation.x = wheel_rotation
		wheel_fr.rotation.x = wheel_rotation
		wheel_rl.rotation.x = wheel_rotation
		wheel_rr.rotation.x = wheel_rotation
		
		var steering_angle = current_steering_input * max_steering_angle
		wheel_fl.rotation.y = steering_angle
		wheel_fr.rotation.y = steering_angle

func setup_engine_audio():
	if engine_audio:
		var audio_stream = AudioStreamGenerator.new()
		audio_stream.mix_rate = 22050
		audio_stream.buffer_length = 0.1
		engine_audio.stream = audio_stream
		engine_audio.play()
		print("AI Engine audio initialized")

func update_engine_audio():
	if engine_audio and engine_audio.playing:
		var speed_ratio = current_speed / max_speed
		var pitch = lerp(0.8, 2.0, clamp(speed_ratio, 0.0, 1.0))
		var volume = lerp(-25.0, -10.0, clamp(speed_ratio * 0.5 + 0.3, 0.0, 1.0))
		
		engine_audio.pitch_scale = pitch
		engine_audio.volume_db = volume

func get_speed_kmh():
	return current_speed * 3.6