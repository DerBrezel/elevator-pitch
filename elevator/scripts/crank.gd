extends StaticBody3D

@export var mesh_highlight : MeshInstance3D
@export var anim : AnimationPlayer
@export var wheel : Node3D
@export var cam : Camera3D
@export var crank_fov : float = 50.0

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
	anim.play("crank")
	cam.fov = crank_fov
	
func stop_interact():
	if not is_interacting:
		return
	is_interacting = false
	Elevator.machine.change_state("MoveUp")
	anim.stop(true)
	cam.fov = 75.0

func highlight():
	#mesh_highlight.visible = true
	wheel.scale = Vector3(1.1, 1.1, 1.1)
	
	
func clear_highlight():
	#mesh_highlight.visible = false
	wheel.scale = Vector3.ONE
