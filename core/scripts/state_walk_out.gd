extends State
class_name MoveDownState

var is_finished : bool

func enter():
	is_finished = false
	await get_tree().create_timer(Elevator.charge/10).timeout
	is_finished = true
	pass

func update(delta: float) -> void:
	if is_finished:
		if Elevator.charge/10 == Elevator.goal:
			machine.change_state("Enter")
		else:
			machine.change_state("Crank")
	
	
func exit():
	pass
