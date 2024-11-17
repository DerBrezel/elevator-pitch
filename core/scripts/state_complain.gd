extends State
class_name ComplainState

var is_finished : bool

func enter():
	is_finished = true
	pass

func update(delta: float) -> void:
	if is_finished:
		machine.change_state("MoveDown")
	
	
func exit():
	pass
