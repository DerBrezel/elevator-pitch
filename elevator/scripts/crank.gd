extends StaticBody3D

@export var mesh : MeshInstance3D
@export var highlight_material : Material

func interact():
	Elevator.add_charge(1.0)

func highlight():
	mesh.material_override.next_pass = highlight_material
	
func clear_highlight():
	mesh.material_override.next_pass = null
