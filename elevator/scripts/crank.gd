extends StaticBody3D

@export var mesh_highlight : MeshInstance3D

func _ready() -> void:
	mesh_highlight.visible = false

func interact():
	Elevator.add_charge(1.0)

func highlight():
	mesh_highlight.visible = true
	
func clear_highlight():
	mesh_highlight.visible = false
