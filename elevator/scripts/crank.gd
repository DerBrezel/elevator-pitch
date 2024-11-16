extends StaticBody3D

@export var mesh : MeshInstance3D
@export var default_material : Material
@export var highlight_material : Material

func interact():
	Elevator.add_charge(1.0)

func highlight():
	mesh.set_surface_override_material(0, highlight_material)
	
func clear_highlight():
	mesh.set_surface_override_material(0,default_material)
