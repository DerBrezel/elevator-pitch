extends RayCast3D

var current_target : Node
var is_active : bool 

func _ready() -> void:
	Elevator.on_state_change.connect(handle_state_change)

func handle_state_change(state : State):
	if state is CrankState:
		is_active = true
	else:
		clear_highlight()
		is_active = false

func _process(delta):
	if not is_active:
		return
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
		clear_highlight()
		print("No object in the center.")

func interact_with_target(target):
	if not target.has_method("interact"):
		return
	# Call the interact method on the target (if defined)
	target.interact()

func clear_highlight():
	if current_target != null:
			if current_target.has_method("clear_highlight"):
				current_target.clear_highlight()
				current_target = null
