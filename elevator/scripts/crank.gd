extends StaticBody3D

@export var mesh_highlight : MeshInstance3D

var is_interacting : bool

func _ready() -> void:
	mesh_highlight.visible = false

func _physics_process(delta: float) -> void:
	if not is_interacting:
		return
	Elevator.add_charge(1.0)

func interact():
	pass
	
func start_interact():
	is_interacting = true
	
func stop_interact():
	if not is_interacting:
		return
	is_interacting = false
	Elevator.machine.change_state("MoveUp")

func highlight():
	mesh_highlight.visible = true
	
func clear_highlight():
	mesh_highlight.visible = false
