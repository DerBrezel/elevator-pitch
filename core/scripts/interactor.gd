extends RayCast3D


func _process(delta):
	# Continuously check for an object in the center of the screen
	if is_colliding():
		var target = get_collider()
		
		if target:
			# Example: Highlight or interact with the target
			print("Looking at:", target.name)
			# Check if the target has a method or script to interact with
			if Input.is_action_pressed("interact"):
				interact_with_target(target)
	else:
		print("No object in the center.")

func interact_with_target(target):
	if not target.has_method("interact"):
		return
	# Call the interact method on the target (if defined)
	target.interact()
