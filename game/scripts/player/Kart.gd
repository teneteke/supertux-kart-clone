extends RigidBody3D

@export var max_speed: float = 30.0
@export var acceleration: float = 10.0
@export var brake_force: float = 20.0
@export var turn_speed: float = 2.0
@export var reverse_speed: float = 10.0

@onready var wheels = $Wheels
@onready var camera = $Camera3D
@onready var wheel_fl = $Wheels/WheelFL
@onready var wheel_fr = $Wheels/WheelFR
@onready var wheel_rl = $Wheels/WheelRL
@onready var wheel_rr = $Wheels/WheelRR
@onready var engine_audio = $EngineAudio

var input_vector = Vector2.ZERO
var current_speed = 0.0
var current_item = ""
var speed_boost_multiplier = 1.0
var speed_boost_duration = 0.0
var wheel_rotation = 0.0
var max_steering_angle = 0.3

func _ready():
	print("Kart initialized")
	setup_engine_audio()

func _process(delta):
	handle_input()
	update_wheel_animation(delta)
	update_engine_audio()

func _physics_process(delta):
	apply_movement(delta)
	apply_steering(delta)

func handle_input():
	input_vector = Vector2.ZERO
	
	if Input.is_action_pressed("move_forward"):
		input_vector.y += 1.0
	if Input.is_action_pressed("move_backward"):
		input_vector.y -= 1.0
	if Input.is_action_pressed("turn_left"):
		input_vector.x -= 1.0
	if Input.is_action_pressed("turn_right"):
		input_vector.x += 1.0
	
	if Input.is_action_just_pressed("use_item"):
		use_item()

func apply_movement(delta):
	var forward = -global_transform.basis.z
	current_speed = linear_velocity.length()
	
	if speed_boost_duration > 0:
		speed_boost_duration -= delta
		if speed_boost_duration <= 0:
			speed_boost_multiplier = 1.0
			print("Speed boost ended")
	
	var effective_max_speed = max_speed * speed_boost_multiplier
	
	if input_vector.y > 0:
		if current_speed < effective_max_speed:
			apply_central_force(forward * acceleration * 100 * delta)
	elif input_vector.y < 0:
		if current_speed < reverse_speed:
			apply_central_force(-forward * acceleration * 50 * delta)
	else:
		linear_velocity = linear_velocity.lerp(Vector3.ZERO, brake_force * delta)
	
	if Input.is_action_pressed("brake"):
		linear_velocity = linear_velocity.lerp(Vector3.ZERO, brake_force * 2 * delta)

func apply_steering(delta):
	if input_vector.x != 0 and current_speed > 0.5:
		var turn_amount = input_vector.x * turn_speed * delta
		var speed_factor = min(current_speed / max_speed, 1.0)
		apply_torque(Vector3(0, turn_amount * speed_factor * 50, 0))


func receive_item(item_type: String):
	current_item = item_type
	print("Received item: " + item_type)

func use_item():
	if current_item == "speed_boost":
		activate_speed_boost()
		current_item = ""
	else:
		print("No item to use")

func activate_speed_boost():
	speed_boost_multiplier = 1.5
	speed_boost_duration = 3.0
	print("Speed boost activated!")

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
		
		var steering_angle = input_vector.x * max_steering_angle
		wheel_fl.rotation.y = steering_angle
		wheel_fr.rotation.y = steering_angle

func setup_engine_audio():
	if engine_audio:
		var audio_stream = AudioStreamGenerator.new()
		audio_stream.mix_rate = 22050
		audio_stream.buffer_length = 0.1
		engine_audio.stream = audio_stream
		engine_audio.play()
		print("Engine audio initialized")

func update_engine_audio():
	if engine_audio and engine_audio.playing:
		var speed_ratio = current_speed / max_speed
		var pitch = lerp(0.8, 2.0, clamp(speed_ratio, 0.0, 1.0))
		var volume = lerp(-20.0, -5.0, clamp(speed_ratio * 0.5 + 0.3, 0.0, 1.0))
		
		engine_audio.pitch_scale = pitch
		engine_audio.volume_db = volume

func get_speed_kmh():
	return current_speed * 3.6