extends State
class_name MoveUpState

var is_finished : bool
@export var label : Label

var duration : float

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
			machine.change_state("WalkOut")
	else:
		duration += delta
		label.text = str(int(duration))
	
	
func exit():
	pass
