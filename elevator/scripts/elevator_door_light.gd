extends Node3D

@export var speed : float = 0.1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Elevator.machine.current_state.name == "MoveUp":
		speed = -0.3
		visible = true
	elif Elevator.machine.current_state.name == "MoveDown":
		visible = true
	else:
		visible = false
		return
	position.y += speed
	position.y = wrapf(position.y, -10, 10)
