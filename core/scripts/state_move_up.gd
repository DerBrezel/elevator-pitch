extends State
class_name MoveUpState

var is_finished : bool

func enter():
	is_finished = false
	await get_tree().create_timer(Elevator.charge/10).timeout
	is_finished = true
	pass

func update(delta: float) -> void:
	if is_finished:
		if Elevator.charge/10 == Elevator.goal:
			machine.change_state("WalkOut")
		else:
			machine.change_state("Complain")
	
	
func exit():
	pass
