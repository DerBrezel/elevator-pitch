extends RayCast3D

@onready var mesh: MeshInstance3D = $"../../Button/MeshInstance3D"


func _process(delta):
	# Continuously check for an object in the center of the screen
	if is_colliding():
		var target = get_collider()
		
		if target:
			# Example: Highlight or interact with the target
			print("Looking at:", target.name)
			# Check if the target has a method or script to interact with
			if Input.is_action_pressed("interact"):
				change_mesh_color(Color(1,0,0))
				interact_with_target(target)
			else:
				change_mesh_color(Color(1,1,1))
	else:
		print("No object in the center.")

func interact_with_target(target):
	if not target.has_method("interact"):
		return
	# Call the interact method on the target (if defined)
	target.interact()

# Call this function with the desired color when you want to change it
func change_mesh_color(new_color: Color) -> void:
	# Ensure the mesh has a material you can modify
	var material := mesh.get_surface_override_material(0)
	if material == null:
		material = StandardMaterial3D.new()
		mesh.set_surface_override_material(0, material)
	
	# Change the albedo color
	material.albedo_color = new_color
