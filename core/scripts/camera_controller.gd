extends Camera3D

# Sensitivity for mouse movement
@export var sensitivity: float = 0.1

# Clamp for vertical rotation (pitch)
@export var pitch_limit: float = 89.0

# Variables to track pitch and yaw
var yaw: float = 0.0
var pitch: float = 0.0

func _ready():
	# Capture the mouse cursor
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		# Adjust yaw (horizontal rotation) and pitch (vertical rotation)
		yaw -= event.relative.x * sensitivity
		pitch -= event.relative.y * sensitivity

		# Clamp the pitch to prevent flipping
		pitch = clamp(pitch, -pitch_limit, pitch_limit)

		# Apply rotation: yaw affects the Player node, pitch affects the Camera
		rotation_degrees.y = yaw
		rotation_degrees.x = pitch
