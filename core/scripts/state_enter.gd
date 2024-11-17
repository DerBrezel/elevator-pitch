extends State
class_name EnterState

var is_finished : bool

func enter():
	is_finished = false
	Elevator.charge = 0.0
	pass

func update(delta: float) -> void:
	if is_finished:
		machine.change_state("Crank")
	
	
func exit():
	pass
