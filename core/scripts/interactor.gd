extends RayCast3D

@onready var mesh: MeshInstance3D = $"../../Crank/MeshInstance3D"

var current_target : Node

func _process(delta):
	# Continuously check for an object in the center of the screen
	if is_colliding():
		var target = get_collider()
		
		if target:			
			if current_target == null:
				current_target = target
				if target.has_method("highlight"):
					target.highlight()
			print("Looking at:", target.name)
			# Check if the target has a method or script to interact with
			if Input.is_action_pressed("interact"):
				interact_with_target(target)

	else:
		if current_target != null:
			if current_target.has_method("clear_highlight"):
				current_target.clear_highlight()
				current_target = null
		print("No object in the center.")

func interact_with_target(target):
	if not target.has_method("interact"):
		return
	# Call the interact method on the target (if defined)
	target.interact()
